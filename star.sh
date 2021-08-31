#!/bin/bash
#SBATCH --job-name STAR_map_sheep_ov
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=6
#SBATCH --cpus-per-task=1
#SBATCH --mem-per-cpu=6g
#SBATCH --time=6:00:00
#SBATCH --account=bakulski1
#SBATCH --partition=standard
#SBATCH --mail-user=johndou@umich.edu
#SBATCH --mail-type=BEGIN,FAIL,END


for path in /nfs/turbo/bakulski1/Datasets/Loch-Caruso/446-SH/Sample_446*; do
	
	SAMPLEID="$(basename "${path}")"
	
	rm -r /nfs/turbo/bakulski1/People/johndou/THP1/STAR/$SAMPLEID/
	mkdir /nfs/turbo/bakulski1/People/johndou/THP1/STAR/$SAMPLEID/
 
  /nfs/turbo/bakulski1/Software/STAR/bin/Linux_x86_64_static/STAR \
  --genomeDir /nfs/turbo/bakulski1/People/kyleac/Placenta_Sort_RNA/genomeReference/refSTARgenome/ \
  --readFilesIn \
  /nfs/turbo/bakulski1/Datasets/Loch-Caruso/446-SH/$SAMPLEID/*.fastq.gz \
  --readFilesCommand gunzip -c \
  --runThreadN 6 \
  --outFilterMultimapNmax 10 \
  --outSAMmode Full \
  --sjdbScore 2 \
  --outFileNamePrefix \
  /nfs/turbo/bakulski1/People/johndou/THP1/STAR/$SAMPLEID/ \
  --outReadsUnmapped Fastx
   
done