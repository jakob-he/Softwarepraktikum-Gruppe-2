require("affy")
require("simpleaffy")
require("affydata")
require("affyQCReport")

files<-list.celfiles("../uploads/current")

celfiles<-ReadAffy(filenames=paste("../uploads/current/",files,sep=""))

if (dir.exists("../output/current")){
  file.rename("../output/current",paste("../output/",file.info("../output/current")[,4],sep=""))
}
outputdir<-dir.create("../output/current")
outputdirplot<-dir.create("../output/current/plots/")
outputdirnorm<-dir.create("../output/current/normalization/")

#plots(density,RNA deg and MA)

setwd("../output/current/plots")

png(filename = "Densityall.png")
plotDensity.AffyBatch(celfiles,log=TRUE,which="both")
dev.off()

degration <- AffyRNAdeg(celfiles)
colorarray<-c(1:length(celfiles))

png(filename = "RNAdegration.png")
plotAffyRNAdeg(degration,col=colorarray)
dev.off()

png(filename= "Intensityhist.png")
hist(celfiles)
dev.off()

png(filename = "Intesityboxplot.png")
boxplot(celfiles,names=seq(from=1, to=length(celfiles),by=1),col="darkgreen",ylab="log intensity",xlab="Arrays")
dev.off()
