files<-list.celfiles("../input/ND_Group2_133Plus_2")
sapply(files,rmaall)
sapply(files,masall)
sapply(files,signalplot)


setwd("../input/rmafiles")
file_list <- list.files()

for (file in file_list){
  if (!exists("dataset")){
    dataset <- read.table(file, header=TRUE, sep="\t")
  }
  if (exists("dataset")){
    temp_dataset <- read.table(file, header=TRUE, sep="\t")
    dataset<-cbind(dataset, temp_dataset)
    rm(temp_dataset)
  }
}

duplicated.columns <- duplicated(t(dataset))

dataset <- dataset[, !duplicated.columns]


ggplot2.density(dataset[1])



rmaall<-function(orignialfile){
  rmafile<-rma(ReadAffy(filenames=paste("../input/ND_Group2_133Plus_2/",orignialfile,sep="")))
  write.exprs(rmafile, file=paste("../input/rmafiles/",orignialfile))
}

masall<-function(orignialfile){
  masfile<-mas5(ReadAffy(filenames=paste("../input/ND_Group2_133Plus_2/",orignialfile,sep="")))
  write.exprs(masfile, file=paste("../input/masfiles/",orignialfile))
}

signalplot<-function(pathtofile,method){
output<-paste("../output/",method,"/",pathtofile,".png",sep="")
pathtofile<-paste("../input/ND_Group2_133Plus_2/",pathtofile,sep="")
celfile<-ReadAffy(filenames=pathtofile)

png(filename = output)
  plotDensity.AffyBatch(celfile,log=TRUE,which="both")
dev.off()
}


