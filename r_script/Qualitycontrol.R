require("affy")
require("simpleaffy")
require("affydata")
require("affyQCReport")
require("bioDist")

files<-list.celfiles("../uploads/current")

celfiles<-ReadAffy(filenames=paste("../uploads/current/",files,sep=""))

if (dir.exists("../output/current")){
  file.rename("../output/current",paste("../output/",file.info("../output/current")[,4],sep=""))
}
outputdir<-dir.create("../output/current")
outputdirplot<-dir.create("../output/current/plots/")
outputdirnorm<-dir.create("../output/current/normalization/")

#plots(density,RNA deg and MA)


#normalization

setwd("../output/current/normalization/")

#rmall<-rma(celfiles)
#write.exprs(rmall, "rma.txt")
#masfile<-mas5(celfiles)
#write.exprs(rmall,"mas5.txt")


setwd("../plots/")

#functions

densityplot <- function(Data){
png(filename = "Densityall.png")
plotDensity.AffyBatch(Data,log=TRUE,which="both")
dev.off()
}

#RNA degration

rnadeg <- function(Data){
degration <- AffyRNAdeg(Data)
png(filename = "RNAdegration.png")
plotAffyRNAdeg(degration)
dev.off()
}

#Intensity histogram

intensityhist <- function(Data){
png(filename= "Intensityhist.png")
hist(Data)
dev.off()
}

#Intensity boxplot

intensitybox <- function(Data){
png(filename = "Intesityboxplot.png")
boxplot(Data,names=seq(from=1, to=length(Data),by=1),col="darkgreen",ylab="log intensity",xlab="Arrays")
dev.off()
}

#Correlation Plot

correlFun <- function(Data, clusterOption1="pearson", clusterOption2="ward", WIDTH=1000, HEIGHT=1414, POINTSIZE=24,MAXARRAY=41){

  if(class(Data) == "AffyBatch") {
    Type <- "Raw"
    text1 <- "Raw data correlation plot"
  }
    png(file = paste(Type,"DataArrayCorrelation.png",sep=""),width=WIDTH,height=HEIGHT,pointsize=POINTSIZE)
    par(oma=c(17,0,0,0),cex.axis=0.7,cex.main=0.8)
    subval <- 10

    COpt1 <- "pearson"
    if (tolower(clusterOption1) == "spearman") COpt1 <- "spearman"
    crp <- cor(exprs(Data), use="complete.obs", method=COpt1)

    text1 <- paste(text1,"\ncorrelation method:",COpt1,"\ncluster method:",clusterOption2)

    switch(tolower(clusterOption1),
           "pearson" = {
             my.dist <- function(x) cor.dist(x, abs=FALSE)
           },
           "spearman" = {
             my.dist <- function(x) spearman.dist(x, abs=FALSE)
           },
           "euclidean" = {
             my.dist <- function(x) euc(x)
           }
    )

    correlationPlot(Data)
    axis(1,side=3,at=seq(from=0.5, to=(length(sampleNames(Data)))-0.5,by=1),
        labels=substr(as.character(sampleNames(Data)),1,subval),las=2)
    par(srt=0)
    plot(c(0,2), type = 'n', ann = FALSE, axes = FALSE,
        frame.plot = FALSE, xlim = c(0, 2), ylim = c(0,2))
    #text(1,1,text1,cex=0.5)
    dev.off()
  }

#Dendogramm

clusterFun <- function(Data, experimentFactor=NULL, clusterOption1="pearson", clusterOption2="ward", WIDTH=1000, HEIGHT=1414, POINTSIZE=24, MAXARRAY=41) {


  if(class(Data)=="AffyBatch") {
    Type <- "Raw"
    main <- "Cluster dendrogram of raw data"
  }
  switch(tolower(clusterOption1),
           "pearson" = {
             correl <- cor.dist(t(exprs(Data)),abs=FALSE)
           },
           "spearman" = {
             correl <- spearman.dist(t(exprs(Data)),abs=FALSE)
           },
           "euclidean" = {
             correl <- euc(t(exprs(Data)))
           }
    )
    clust <- hclust(correl, method = tolower(clusterOption2))
    png(file = paste(Type,"DataCluster_",clusterOption1,".png",sep=""),width=WIDTH,height=HEIGHT,pointsize=POINTSIZE)
    if(length(sampleNames(Data))<MAXARRAY) {
      cexval1 <- 0.75
      cexval2 <- 1.23
      cexval3 <- 0.55
    } else {
      cexval1 <- 0.55
      cexval2 <- 1.6
      cexval3 <- 0.41
    }
    par(cex=cexval1,oma=c(14,1,0,0))
    par(cex.axis=cexval2,cex.lab=cexval2,cex.main=cexval2)
    plot(clust, hang=-1, main=main, xlab=paste("distance:",clusterOption1), sub=paste(" cluster method:",clusterOption2))
    points(1:length(clust$order),rep(0,length(clust$order)),pch=15,col="white",cex=1.5)
    par(cex=cexval3)
    dev.off()
  }

qcplot <- function(Data){
  qcdata<-qc(Data)
  png(filename = "qcplot.png")
  plot(qcdata)
  dev.off()
  png(filename = "percentpresent.png")
  plot(percent.present(qcdata))
  dev.off()
}


densityplot(celfiles)
rnadeg(celfiles)
intensitybox(celfiles)
intensityhist(celfiles)
correlFun(celfiles)
clusterFun(celfiles)
qcplot(celfiles)
