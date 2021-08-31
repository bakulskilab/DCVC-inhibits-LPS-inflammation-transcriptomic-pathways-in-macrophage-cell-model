#!/bin/bash
#SBATCH --job-name QoRTs_THP1
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=1
#SBATCH --mem-per-cpu=6g
#SBATCH --time=44:00:00
#SBATCH --account=bakulski1
#SBATCH --partition=standard
#SBATCH --mail-user=johndou@umich.edu
#SBATCH --mail-type=BEGIN,FAIL,END

module load Bioinformatics
module load samtools/1.9

for path in /nfs/turbo/bakulski1/People/johndou/THP1/STAR/Sample_446*; do
	
	SAMPLEID="$(basename "${path}")"
	
	cd /nfs/turbo/bakulski1/People/johndou/THP1/STAR/$SAMPLEID/
	samtools view -b -S Aligned.out.sam > Aligned.out.bam
	samtools sort -n Aligned.out.bam -o Aligned.out.sorted
 
	rm -r /nfs/turbo/bakulski1/People/johndou/THP1/QoRTs/$SAMPLEID/
	mkdir /nfs/turbo/bakulski1/People/johndou/THP1/QoRTs/$SAMPLEID/
    
	java -Xmx16G -jar /nfs/turbo/bakulski1/People/johndou/BeWo_RNAseq/QoRTs.jar QC\
	--stranded \
	/nfs/turbo/bakulski1/People/johndou/THP1/STAR/$SAMPLEID/Aligned.out.sorted  \
	/nfs/turbo/bakulski1/People/kyleac/Placenta_Sort_RNA/genomeReference/gtfAnnotation/gencode.v28.annotation.gtf  \
	/nfs/turbo/bakulski1/People/johndou/THP1/QoRTs/$SAMPLEID/

done


#clean up
for path in /nfs/turbo/bakulski1/People/johndou/THP1/STAR/Sample_446*; do

	SAMPLEID="$(basename "${path}")"
	cd /nfs/turbo/bakulski1/People/johndou/THP1/STAR/$SAMPLEID/
	rm Aligned.out.bam
	rm Aligned.out.sam

done
