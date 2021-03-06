\name{MVP.Report}
\alias{MVP.Report}
\title{report and visualize the results}
\description{
report and visualize the results
}
\usage{
MVP.Report <- function(MVP,col=c("dodgerblue1", "olivedrab3", "darkgoldenrod1", "red"),bin.size=1e6,bin.max=NULL,pch=19,
	band=1,cir.band=0.5,H=1.5,ylim=NULL,cex.axis=1,plot.type="b",multracks=FALSE,cex=c(0.5,0.8,1),r=0.3,xlab="Chromosome",
	ylab=expression(-log[10](italic(p))),xaxs="i",yaxs="r",outward=FALSE,threshold = NULL, threshold.col="red",threshold.lwd=1,
	threshold.lty=2,amplify= TRUE,chr.labels=NULL,signal.cex = 0.8,signal.pch = 19,signal.col="red",signal.line=NULL,
	cir.chr=TRUE,cir.chr.h=0.6,cir.chr.col="black",cir.legend=TRUE,cir.legend.cex=0.8,cir.legend.col="grey45",LOG10=TRUE,
	box=FALSE,conf.int=TRUE,conf.int.col="grey",file.output=TRUE,file="jpg",dpi=300)
}
\arguments{
  \item{MVP}{
a dataframe, at least four columns. The first column is the name of SNP, the second column is the chromosome of SNP, the third column is the position of SNP, and the remaining columns are the P-value of each trait(Note:each trait a column).
}
  \item{col}{
a vector or a matrix, if "col" equals to a vector, each circle use the same colors, it means that the same chromosome is drewed in the same color, the colors are not fixed, one, two, three or more colors can be used, if the length of the "col" is shorter than the length the chromosome, then colors will be applied circularly. 
if "col" equals to a matrix, the row is the number of circles(traits), the columns are the colors that users want to use for different circles, so each circle can be plotted in different number of colors, the missing value can be replaced by NA. For example: 
col=matrix(c("grey30","grey60",NA,"red","blue","green","orange",NA,NA),3,3,byrow=T).
}
  \item{pch}{
a number, the type for the points, is the same with "pch" in <plot>.
}
  \item{band}{
a number, the space between chromosomes, the default is 1(if the band equals to 0, then there would be no space between chromosome).
}
  \item{cir.band}{
a number, the space between circles, the default is 1.
}
  \item{H}{
a number, the height for each circle, each circle represents a trait, the default is 1.
}
  \item{ylim}{
a vector, the range of Y-axis when plotting the two type of Manhattans, is the same with "ylim" in <plot>.
}
  \item{cex.axis}{
a number, controls the size of numbers of X-axis and the size of labels of circle plot.
}
  \item{plot.type}{
a character or vector, only "d", "c", "m", "q" or "b" can be used. if plot.type="c", SNP density will be plotted; if plot.type="c", only circle-Manhattan plot will be plotted; if plot.type="m",only Manhattan plot will be plotted; if plot.type="q",only Q-Q plot will be plotted;if plot.type="b", both circle-Manhattan, Manhattan and Q-Q plots will be plotted; if plot.type=c("m","q"), Both Manhattan and Q-Q plots will be plotted.
}
  \item{multracks}{
a logical,if multracks=FALSE, plotting multiple rectangular Manhattan plots on multiple tracks, if it is TRUE, all Manhattan plots will be plotted in only one track.
}
  \item{cex}{
a number or a vector, the size for the points, is the same with "size" in <plot>, and if it is a vector, the first number controls the size of points in circle plot(the default is 0.5), the second number controls the size of points in Manhattan plot(the default is 1), the third number controls the size of points in Q-Q plot(the default is 1)
}
  \item{r}{
a number, the radius for the circle(the inside radius), the default is 1.
}
  \item{xlab}{
a character, the labels for x axis.
}
  \item{ylab}{
a character, the labels for y axis.
}
  \item{xaxs}{
a character, The style of axis interval calculation to be used for the x-axis. Possible values are "r", "i", "e", "s", "d". The styles are generally controlled by the range of data or xlim, if given.
}
  \item{yaxs}{
a character, The style of axis interval calculation to be used for the y-axis. See xaxs above..
}
  \item{outward}{
logical, if outward=TRUE,then all points will be plotted from inside to outside.
}
  \item{threshold}{
a number or vector, users can adjust the significant level they want,for example c(0.05,0.01). Bonfferoni adjustment method is used in default(threshold/N, N is the number of markers), more than one significant line can be added on the plots, if threshold=0 or NULL, then the threshold line will not be added.
}
  \item{threshold.col}{
a character or vector, the colour for the line of threshold levels.
}
  \item{threshold.lwd}{
a number or vector, the width for the line of threshold levels.
}
  \item{threshold.lty}{
a number or vector, the type for the line of threshold levels.
}
  \item{amplify}{
logical, CMplot can amplify the significant points, if amplify=T, then the points greater than the minimal significant level will be highlighted, the default: amplify=TRUE.
}
  \item{chr.labels}{
a vector, the labels for the chromosomes of circle-Manhattan plot.
}
  \item{signal.cex}{
a number, if amplify=TRUE, users can set the size of significant points.
}
  \item{signal.pch}{
a number, if amplify=TRUE, users can set the shape of significant points.
}
  \item{signal.col}{
a character, if amplify=TRUE, users can set the colour of significant points, if signal.col=NULL, then the colors of significant points will not be changed.
}
  \item{signal.line}{
a number, the width of the lines cross the circle
}
  \item{cir.chr}{
logical, a boundary represents chromosome, the default is TRUE.
}
  \item{cir.chr.h}{
a number, the width for the boundary, if cir.chr=FALSE, then this parameter will be useless.
}
  \item{cir.chr.col}{
a character, the colour for the boundary, only one colour is allowed, if cir.chr.col=NULL, then the default colours are the same with the parameter "col".
}
  \item{cir.legend}{
logical, whether to add the legend of each circle.
}
  \item{cir.legend.cex}{
a number, the size of the number of legend.
}
  \item{cir.legend.col}{
a character, the color of the axis of legend.
}
  \item{LOG10}{
logical, whether to change the p-value into log10(p-value).
}
 \item{box}{
logical, this function draws a box around the current Manhattan plot.
}
  \item{conf.int}{
logical, whether to drew the confidence interval on QQ-plot.
}
  \item{conf.int.col}{
a character, the color of the confidence interval on QQ-plot.
}
 \item{file.output}{
a logical, users can choose whether to output the plot results.
}
 \item{file}{
a character, users can choose the different output formats of plot, so for, "jpg", "pdf", "tiff" can be selected by users.
}
  \item{dpi}{
a number, the picture element for .jpg and .tiff files. The default is 300.
}
}
\author{
Lilin Yin, Zhiwu Zhang, Xinyun Li, Shuhong Zhao, and Xiaolei Liu \cr
Maintainer: Xiaolei Liu <\bold{xiaoleiliu@mail.hzau.edu.cn}>
}
