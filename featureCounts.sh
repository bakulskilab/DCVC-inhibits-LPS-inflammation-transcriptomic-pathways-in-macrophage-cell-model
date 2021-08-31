#!/bin/bash
#SBATCH --job-name featureCount_sheep_run2823
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=9
#SBATCH --mem-per-cpu=100mb
#SBATCH --time=1:00:00
#SBATCH --account=bakulski1
#SBATCH --partition=standard
#SBATCH --mail-user=johndou@umich.edu
#SBATCH --mail-type=BEGIN,FAIL,END


module load Bioinformatics
module load subread/1.6.0

ALIGNED=$(find /nfs/turbo/bakulski1/People/johndou/THP1/STAR/ -name "Aligned.out.sorted")

cd /nfs/turbo/bakulski1/People/johndou/THP1/STAR/
 
featureCounts \
	-p \
	-T 9 \
	-s 2 \
	-t exon \
	-g gene_id \
	-a /nfs/turbo/bakulski1/People/kyleac/Placenta_Sort_RNA/genomeReference/gtfAnnotation/gencode.v28.annotation.gtf \
	-o /nfs/turbo/bakulski1/People/johndou/THP1/featureCounts/counts \
	$ALIGNED
