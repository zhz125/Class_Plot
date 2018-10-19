#  Created on Mon Oct  15
#  @author: zheng zhang
#  Frist Step of file preparation
#  @purpose: find xlogp for csi, berep, GNPS_anal and GNPS simile candidates for each feature
#            use rcdk to keep the results consistent with ChemRICH
#
#  @input : annotation file
#  @output: with_xlogp.csv, which will be processed further in the prepare_form.py

input_file <- commandArgs(trailingOnly = TRUE)
name <- read.csv(file=input_file,header=TRUE, sep="\t",stringsAsFactors=FALSE)
name$xlogp_csi <- as.numeric(sapply(name$CSI_smiles, function(x)  {
    if(x!='')
        rcdk::get.xlogp(rcdk::parse.smiles(x)[[1]])
    else
        NA
}))
name$xlogp_derep <- as.numeric(sapply(name$DEREP_SMILES, function(x)  {
    if(x!='')
        rcdk::get.xlogp(rcdk::parse.smiles(x)[[1]])
    else
        NA
}))
name$xlogp_GNPS_anal <- as.numeric(sapply(name$GNPS_ANAL_Smiles, function(x)  {
    if(x!='')
    rcdk::get.xlogp(rcdk::parse.smiles(x)[[1]])
    else
    NA
}))
name$xlogp_GNPS <- as.numeric(sapply(name$GNPS_Smiles, function(x)  {
    if(x!='')
    rcdk::get.xlogp(rcdk::parse.smiles(x)[[1]])
    else
    NA
}))
dir.create(file.path('intermediate_files'), showWarnings = FALSE)
setwd(file.path('intermediate_files'))
write.csv(name,file="with_xlogp.csv",row.names=FALSE)
