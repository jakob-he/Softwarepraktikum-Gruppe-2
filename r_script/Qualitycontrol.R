files<-list.celfiles("../input/ND_Group2_133Plus_2")
sapply(files,rmaall)
sapply(files,masall)
sapply(files,signalplot)
sapply(files,rnadeg)
sapply(files,createimages)

setwd("~/Schreibtisch/Uni/Softwarepraktikum/Gruppe_2/input/ND_Group2_133Plus_2")
cefiles<-list.celfiles()
celfiles<-ReadAffy(filenames=cefiles)

data.qc=qc(celfiles)

png(filename = "../../output/densityall.png")
plotDensity.AffyBatch(celfiles,log=TRUE,which="both")
dev.off()

degration <- AffyRNAdeg(celfiles)

png(filename = "../../output/rnadegall.png")
plotAffyRNAdeg(degration,col=c(1,2,3,4,5,6,7))
dev.off()

png(filename = "../../output/densityallhist.png")
hist(celfiles)
dev.off()

png(filename = "../../output/densityallbox.png")
boxplot(celfiles,names=seq(from=1, to=7,by=1),col="darkgreen",ylab="log intensity",xlab="Arrays")
dev.off()

png(filename = "../../output/MAplot.png")
MAplot(celfiles,plot.method="smoothScatter")
dev.off()

png(filename = "../../output/MAplotpairwise.png")
MAplot(celfiles[,1:3],pairs=TRUE,plot.method="smoothScatter")
dev.off()

rmall<-rma(celfiles)
masfile<-mas5(celfiles)


        
rmaall<-function(orignialfile){
  rmafile<-rma(ReadAffy(filenames=paste("../input/ND_Group2_133Plus_2/",orignialfile,sep="")))
  write.exprs(rmafile, file=paste("../input/rmafiles/",orignialfile))
}

masall<-function(orignialfile){
  masfile<-mas5(ReadAffy(filenames=paste("../input/ND_Group2_133Plus_2/",orignialfile,sep="")))
  write.exprs(masfile, file=paste("../input/masfiles/",orignialfile))
}

signalplot<-function(pathtofile){
output<-paste("../output/nonorm/singalint/",pathtofile,".png",sep="")
pathtofile<-paste("../input/ND_Group2_133Plus_2/",pathtofile,sep="")
celfile<-ReadAffy(filenames=pathtofile)

png(filename = output)
  plotDensity.AffyBatch(celfile,log=TRUE,which="both")
dev.off()
}

rnadeg<-function(pathtofile){
  output<-paste("../output/nonorm/rnadeg/",pathtofile,".png",sep="")
  pathtofile<-paste("../input/ND_Group2_133Plus_2/",pathtofile,sep="")
  celfile<-ReadAffy(filenames=pathtofile)
  
  deg <- AffyRNAdeg(celfile)
  
  png(filename = output)
  plotAffyRNAdeg(deg)
  dev.off()
}

createimages<-function(pathtofile){
  output<-paste("../output/nonorm/images/",pathtofile,".png",sep="")
  pathtofile<-paste("../input/ND_Group2_133Plus_2/",pathtofile,sep="")
  celfile<-ReadAffy(filenames=pathtofile)
  
  png(filename = output)
  image(celfile,col=rainbow(6))
  dev.off()
}


