#!/bin/bash
#SBATCH --job-name fastqc_thp1
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=1
#SBATCH --cpus-per-task=1
#SBATCH --mem-per-cpu=500m
#SBATCH --time=8:00:00
#SBATCH --account=bakulski1
#SBATCH --partition=standard
#SBATCH --mail-user=johndou@umich.edu
#SBATCH --mail-type=BEGIN,FAIL,END

module load Bioinformatics
module load fastqc/0.11.8

for path in /nfs/turbo/bakulski1/Datasets/Loch-Caruso/446-SH/Sample_446*; do

	SAMPLEID="$(basename "${path}")"
	
	mkdir /nfs/turbo/bakulski1/People/johndou/THP1/fastqc/$SAMPLEID/
	
	fastqc \
	/nfs/turbo/bakulski1/Datasets/Loch-Caruso/446-SH/$SAMPLEID/*.fastq.gz \
	--outdir=/nfs/turbo/bakulski1/People/johndou/THP1/fastqc/$SAMPLEID/

done


module load python3.7-anaconda

cd /nfs/turbo/bakulski1/People/johndou/THP1/fastqc/
python /nfs/turbo/bakulski1/People/johndou/import_multiqc.py

multiqc \
/nfs/turbo/bakulski1/People/johndou/THP1/fastqc/Sample_446*
