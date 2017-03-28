args <- commandArgs(TRUE)
library("affy")
N <- args[1]
output<-paste("./output/images/",N,".png",sep="")
pathtofile<-paste("./uploads/",N,sep="")
celfile<-ReadAffy(filenames=pathtofile)
  
png(filename = output)
image(celfile,col=rainbow(6))
dev.off()

