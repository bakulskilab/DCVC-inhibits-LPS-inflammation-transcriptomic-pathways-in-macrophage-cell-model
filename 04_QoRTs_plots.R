###############################
#QoRTs plots
###############################

# done after running the QoRTs program on STAR output
# line to start interactive job on great lakes
# srun --nodes=1 --ntasks-per-node=1 --mem-per-cpu=4GB --pty /bin/bash

library(openxlsx)
meta <- read.xlsx("/nfs/turbo/bakulski1/Datasets/Loch-Caruso/446-SH/THP experiment sample IDs.xlsx")

#get all the folders from QoRTs
folders <- list.dirs(path='/nfs/turbo/bakulski1/People/johndou/THP1/QoRTs/',recursive=T)
folders <- folders[-1]

#format variables and check folders order same as meta
names(folders) <- gsub('.*Sample_','',folders)
meta$folder <- paste('/',meta$Sample.ID, sep='')



decoder <- data.frame(unique.ID=meta$folder,
                      group.ID=meta$Treatment,
                      sample.ID=meta$Sample.ID)
  

library(QoRTs)
library(png)

res <- read.qc.results.data('/nfs/turbo/bakulski1/People/johndou/THP1/QoRTs/', decoder=decoder)
#
makeMultiPlot.all(res, outfile.dir='/nfs/turbo/bakulski1/People/johndou/THP1/QoRTs/',plot.device.name='pdf')
