## 
## South Dade Water Quality Status Report
## Base code
##
## Code was compiled by Paul Julian
## contact info: paul.julian@floridadep.gov

## BAD 
## https://www.tidyverse.org/articles/2017/12/workflow-vs-script/
## Clears Everything...start fresh.
rm(list=ls(all=T));cat("\014");dev.off()

## Libraries
# Data Wrangling
library(AnalystHelper);
library(plyr)
library(reshape)

library(Hmisc)
# Paths
wd="C:/Julian_LaCie/_Github/SouthDade_WQ"
paths=paste0(wd,c("/Exports","/Plots","/Data","/src"))
# Folder.Maker(paths);#One and done. Creates folders in working directory.
export.path=paths[1]
plot.path=paths[2]
data.path=paths[3]

# Function
fdc.v2=function(x){
  ##Flow duration curve adpated from fdc function in library(hydroTSM)
  
  x <- as.numeric(x)
  x.old <- x
  x <- sort(x)
  
  # Detecting zero values
  x.zero.index <- which(x==0)
  nzeros <- length(x.zero.index)
  
  # Index with the position of the original values
  ind <- match(x.old, x)
  
  n <- length(x)
  
  dc <- rep(NA, n)
  
  # Exceedance Probability
  dc[1:n] <- sapply(1:n, function(j,y) {
    dc[j] <- length( which(y >= y[j]) )
  }, y = x)
  
  # Computing the probabilitites as a percent
  dc <- (dc/n)*100
  
  if(nzeros>0){
    x=x[-x.zero.index]
    dc=dc[-x.zero.index]
  }
  
  rslt=data.frame(flow=x,PerExceed=dc)
  return(rslt)
}
Q.thr=function(fdc.obj,PerExceed.val){
  Qposition <- function(x, Q) {
    # Returns the position in the vector 'x' where the scalar 'Q' is located 
    Q.dist  <- abs(x - Q)
    Q.index <- which.min( Q.dist )
    return(Q.index)
  }
  
  thr=fdc.obj$flow[Qposition(fdc.obj$PerExceed,PerExceed.val)]
  return(thr)
}
# -------------------------------------------------------------------------
dates=date.fun(c("1978-05-01","2020-04-30"))

flow.wq.sites=data.frame(SITE=c(rep("S173",2),rep("S331",2),"S357",rep("S332B",2),"S332C","S174",rep("S332D",3),rep("S176",4),"S332DX1","S328",rep("S332",2),"S200","G737","S175","S199",rep("S177",2),"S18C","S197",rep("S178",2)),
                      DBKEY=c("FB759","91419","FB758","91479","91515","TB064","P0995","91483","91420","TA413","P0996",NA,"15762","P0970","AN608",NA,"91484","AN558","15753","P0994","91437","AN674","15752","91436","91423","P0971","15760","15763","FB761","91424"),
                      Priority=c("P1","P2","P1","P2","P1","P1","P2","P1","P1","P1","P2",NA,"P1","P2","P3",NA,"P1","P1","P1","P2","P1","P1","P1","P1","P1","P2","P1","P1","P1","P2"),
                      WQSite=c(rep("S331-173",4),"S357",rep("S332B",2),"S332C","S174",rep("S332DX",2),"S332D",rep("S176",3),"S332DX",NA,"S328",rep("S332",2),"S200","G737","S175",rep("S177",3),"S18C","S197",rep("S178",2)))


# Discharge ---------------------------------------------------------------
flow.sites=subset(flow.wq.sites,is.na(DBKEY)==F)
pb=txtProgressBar(min=1,max=nrow(flow.sites),style=3)
flow.dat=data.frame()
for(i in 1:nrow(flow.sites)){
  tmp=DBHYDRO_daily(dates[1],dates[2],flow.sites$DBKEY[i])
  tmp$DBKEY=as.character(flow.sites$DBKEY[i])
  flow.dat=rbind(tmp,flow.dat)
  setTxtProgressBar(pb,i)
}

flow.dat$WY=WY(flow.dat$Date,"FL")
flow.dat$Date.EST=date.fun(flow.dat$Date)
flow.dat=merge(flow.dat,flow.sites,"DBKEY")

flow.xtab=data.frame(cast(flow.dat,Date.EST+WY+SITE~Priority,value="Data.Value",fun.aggregate=function(x) ifelse(sum(x,na.rm=T)==0,NA,sum(x,na.rm=T))))
flow.xtab$fflow.cfs=with(flow.xtab,ifelse(is.na(P2)&is.na(P3),P1,ifelse(is.na(P1)&is.na(P3),P2,ifelse(is.na(P1)&is.na(P2),P3,P2))));#final flow value for analysis
flow.xtab$fflow.cfs=ifelse(is.na(flow.xtab$fflow.cfs)==T,0,flow.xtab$fflow.cfs)
range(flow.xtab$fflow.cfs,na.rm=T)


##Sanity Check
plot(fflow.cfs~Date.EST,subset(flow.xtab,SITE=="S178"),type="l")
flow.xtab$rev.fflow.cfs=with(flow.xtab,ifelse(fflow.cfs<0,fflow.cfs,0))
flow.xtab$fflow.cfs=ifelse(flow.xtab$fflow.cfs<0,0,flow.xtab$fflow.cfs)
plot(fflow.cfs~Date.EST,subset(flow.xtab,SITE=="S178"),type="l")

flow.site.da=ddply(flow.xtab,c("SITE","Date.EST","WY"),summarise,Q.cfs=sum(fflow.cfs,na.rm=T),rev.Q.cfs=sum(rev.fflow.cfs*-1,na.rm=T))
flow.site.da$Q.m3d=cfs.to.m3d(flow.site.da$Q.cfs)
WY.flow=ddply(flow.site.da,c("SITE","WY"),summarise,Q.m3d=sum(cfs.to.m3d(Q.cfs),na.rm=T))

da.max=ddply(flow.site.da,c("SITE"),summarise,max.val=max(Q.m3d,na.rm=T))
da.max$rnd.val=round(da.max$max.val,-5)

WY.max=ddply(WY.flow,c("SITE"),summarise,max.val=max(Q.m3d,na.rm=T))
WY.max$rnd.val=round(WY.max$max.val,-7)

flow.Sites=unique(WY.flow$SITE)

par(family="serif",mar=c(1,2.5,1,2),oma=c(3,4,0.75,0.1));
layout(matrix(seq(1,3,1),1,3,byrow=T));

i=1
dat.da=subset(flow.site.da,SITE==flow.Sites[i])
fdc.dat.da=fdc.v2(dat.da$Q.m3d)
dat.WY=subset(WY.flow,SITE==flow.Sites[i])
#tiff(filename=paste0(plot.path,flow.Sites[i],"_hydro.tiff"),width=6.5,height=3,units="in",res=200,type="windows",compression=c("lzw"),bg="white")
#par(family="serif",mar=c(1,2.5,1,2),oma=c(3,4,0.75,0.1));
#layout(matrix(seq(1,3,1),1,3,byrow=T));

#flow duration curve
ylim.val=c(9,9e6);ymaj=c(10^seq(0,9));ymin=c(seq(1,10,1),seq(10,100,10),seq(100,1000,100),seq(1e3,1e4,1e3),seq(1e4,1e5,1e4),seq(1e5,1e6,1e5),seq(1e6,1e7,1e6),seq(1e7,1e8,1e7),seq(1e8,1e9,1e8),seq(1e9,1e10,1e9))#by.y=2;ymaj=seq(ylim.val[1],ylim.val[2],by.y);ymin=seq(ylim.val[1],ylim.val[2],by.y/2)
xlim.val=c(0,100);by.x=20;xmaj=seq(xlim.val[1],xlim.val[2],by.x);xmin=seq(xlim.val[1],xlim.val[2],by.x/2)
plot(flow~PerExceed,fdc.dat.da,type="n",ylim=ylim.val,xlim=xlim.val,yaxs="i",xaxs="i",yaxt="n",xaxt="n",ylab=NA,xlab=NA,log="y");
abline(h=ymaj,v=xmaj,lty=3,col="grey")
with(fdc.dat.da,lines(PerExceed,flow,lwd=1.5))
if(max(fdc.dat.da$PerExceed)>20){lines(rep(20,2),c(Q.thr(fdc.dat.da,20),0.001),lty=2,col="red",cex=4,lwd=1.5)}
if(max(fdc.dat.da$PerExceed)>70){lines(rep(70,2),c(Q.thr(fdc.dat.da,70),0.001),lty=2,col="red",cex=4,lwd=1.5)}
if(max(fdc.dat.da$PerExceed)>20){points(20,Q.thr(fdc.dat.da,20),pch=21,bg="indianred1",cex=1.5)}
if(max(fdc.dat.da$PerExceed)>70){points(70,Q.thr(fdc.dat.da,70),pch=21,bg="indianred1",cex=1.5)}
axis_fun(2,ymaj,ymaj,format(ymaj,scientific=F),1);box(lwd=1)
axis_fun(1,xmaj,xmin,xmaj,1)
mtext(side=2,line=4.5,"Daily Flow (m\u00B3 d\u207B\u00B9)",cex=0.9)
mtext(side=1,line=2,"Percent Exceedance",cex=0.9)
  
#Daily Discharge
ylim.val=c(0,subset(da.max,SITE==flow.Sites[i])$rnd.val);by.y=subset(da.max,SITE==flow.Sites[i])$rnd.val/5;ymaj=seq(ylim.val[1],ylim.val[2],by.y);ymin=seq(ylim.val[1],ylim.val[2],by.y/2)
xlim.val=date.fun(dates);xmaj=seq(xlim.val[1],xlim.val[2],"15 years");xmin=seq(xlim.val[1],xlim.val[2],"1 years")
plot(Q.m3d~Date.EST,dat.da,ylim=ylim.val,xlim=xlim.val,yaxt="n",xaxt="n",type="n",ylab=NA,xlab=NA,yaxs="i")
abline(h=ymaj,v=xmaj,lty=3,col="grey")
with(dat.da,shaded.range(Date.EST,rep(0,nrow(dat.da)),Q.m3d,bg="indianred1",lty=0,col.adj = 0.8))
axis_fun(2,ymaj,ymin,format(ymaj/1e4),1);box(lwd=1)
axis_fun(1,line=-0.5,xmaj,xmin,format(xmaj,"%m-%Y"),0.8)
mtext(side=2,line=2,"Flow (x10\u2074 m\u00B3 d\u207B\u00B9)",cex=0.9)
mtext(side=1,line=2,"Month-Year",cex=0.9)

#Annual Discharge
ylim.val=c(0,subset(WY.max,SITE==flow.Sites[i])$rnd.val);by.y=subset(WY.max,SITE==flow.Sites[i])$rnd.val/4;ymaj=seq(ylim.val[1],ylim.val[2],by.y);ymin=seq(ylim.val[1],ylim.val[2],by.y/2)
xlim.val=WY(dates);by.x=10;xmaj=seq(xlim.val[1],xlim.val[2],by.x);xmin=seq(xlim.val[1],xlim.val[2],by.x/by.x)
plot(Q.m3d~WY,dat.WY,ylim=ylim.val,xlim=xlim.val,yaxt="n",xaxt="n",type="n",ylab=NA,xlab=NA,yaxs="i")
abline(h=ymaj,v=xmaj,lty=3,col="grey")
with(dat.WY,shaded.range(WY,rep(0,nrow(dat.WY)),Q.m3d,bg="dodgerblue1",col="black",lty=1,col.adj = 0.5))
axis_fun(2,ymaj,ymin,format(ymaj/1e6),1);box(lwd=1)
axis_fun(1,line=-0.5,xmaj,xmin,xmaj,0.9)
mtext(side=2,line=2.5,"Flow (x10\u2076 m\u00B3 WY\u207B\u00B9)",cex=0.9)
mtext(side=1,line=2,"Water Year",cex=0.9)
mtext(side=3,line=-0.5,flow.Sites[i],outer=T)


# WQ ----------------------------------------------------------------------
wq.sites=ddply(subset(flow.wq.sites,is.na(WQSite)==F),"WQSite",summarise,N.val=N.obs(WQSite))
wq.sites2=ddply(subset(flow.wq.sites,is.na(WQSite)==F),c("SITE","WQSite"),summarise,N.val=N.obs(WQSite))[,c("SITE","WQSite")]

wq.dat=DBHYDRO_WQ(dates[1],dates[2],wq.sites$WQSite,25)
unique(wq.dat$Station.ID)%in%wq.sites$WQSite

wq.dat=subset(wq.dat,Collection.Method%in%c("G","GP"))
wq.dat=merge(wq.dat,wq.sites2,by.x="Station.ID",by.y="WQSite")
wq.dat.da=ddply(wq.dat,c("SITE","Date.EST"),summarise,meanTP=mean(HalfMDL,na.rm = T),N.val=N.obs(HalfMDL,na.rm=T))
head(wq.dat.da)

head(flow.site.da)
vars=c("Date.EST","SITE","meanTP")
flow.wq=merge(flow.site.da,wq.dat.da[,vars],c("SITE","Date.EST"),all.y=T)
flow.wq$meanTP=flow.wq$meanTP*1000
flow.wq$meanTP.flow=with(flow.wq,ifelse(Q.cfs>0,meanTP,NA))
flow.wq$meanTP.noflow=with(flow.wq,ifelse(Q.cfs>0,NA,meanTP))
flow.wq$crossprod=with(flow.wq,Q.cfs*meanTP)
flow.wq=merge(flow.wq,ddply(flow.wq,c("SITE","WY"),summarise,N.val.scn=N.obs(crossprod)),c("SITE","WY"))

flow.wq.WY=ddply(subset(flow.wq,is.na(crossprod)==F&N.val.scn>3),c("SITE","WY"),summarise,FWM=wtd.mean(meanTP,Q.cfs,na.rm=T),WSTD=sqrt(wtd.var(meanTP,Q.cfs,na.rm=T)),N.val=N.obs(crossprod))
flow.wq.WY$FWM=with(flow.wq.WY,ifelse(is.nan(FWM),NA,FWM))
flow.wq.WY$WSE=with(flow.wq.WY,WSTD/sqrt(N.val))
flow.wq.WY$DOF=with(flow.wq.WY,ifelse(N.val==1,1,N.val-1))  
flow.wq.WY$CI=0.10
flow.wq.WY$Tp=with(flow.wq.WY,abs(qt(CI,DOF)))
flow.wq.WY$CI.Upper=with(flow.wq.WY,FWM+((WSTD*Tp)/sqrt(N.val)))
flow.wq.WY$CI.Lower=with(flow.wq.WY,FWM-((WSTD*Tp)/sqrt(N.val)))
flow.wq.WY
flow.wq.WY$FWM.plot=with(flow.wq.WY,ifelse(is.na(FWM)==T,0,FWM))

sites=unique(flow.wq.WY$SITE)
wys=seq(1979,WY(dates[2]),1)
fill.wys=data.frame(SITE=sort(rep(sites,length(wys))),WY=rep(wys,length(sites)),fill=1)
flow.wq.WY=merge(flow.wq.WY,fill.wys,all.y=T)


plot(FWM~WY,subset(flow.wq.WY,SITE=="S328"))
plot(meanTP~Date.EST,subset(flow.wq,SITE=="S328"))

# da.wq.max=ddply(flow.wq,c("SITE"),summarise,max.val=max(meanTP,na.rm=T))
da.wq.max=data.frame(SITE=c("S173", "S174", "S175", "S176", "S177", "S178", "S18C", "S197","S199", "S200", "S331", "S332", "S332B", "S332C", "S332D", "S357","S328","G737"),
                     max.val=c(40,40,60,200,150,300,60,150,32,25,40,60,20,25,60,11,1000,100),
                     by.val=c(10,10,20,20,50,100,20,25,10,5,10,20,10,5,20,2,500,25))

# da.wq.wy.max=ddply(flow.wq.WY,c("SITE"),summarise,min.val=min(FWM-WSE,na.rm=T),max.val=max(FWM+WSE,na.rm=T))
da.wq.wy.max=data.frame(SITE=c("S173", "S174", "S175", "S176", "S177", "S178", "S18C", "S197","S199", "S200", "S331", "S332", "S332B", "S332C", "S332D", "S357","S328","G737"),
                        max.val=c(15,20,12,40,20,200,28,100,10,10,10,20,10,10,15,10,10,10),
                        by.val=c(5,5,2,10,5,50,5,20,2,2,2,5,2,2,5,2,2,2))

wq.Sites=as.character(da.wq.max$SITE)

par(family="serif",mar=c(3,1.1,1,1),oma=c(1,2.5,0.75,0.1));
layout(matrix(c(seq(1,3,1),3),2,2,byrow=T));
dat.da=subset(flow.wq,SITE==as.character(wq.Sites[i]))
fdc.dat.da.all=fdc.v2(dat.da$meanTP)
fdc.dat.da.flow=fdc.v2(dat.da$meanTP.flow)
dat.WY=subset(flow.wq.WY,SITE==wq.Sites[i])
  
ylim.val=c(1,subset(da.wq.max,SITE==wq.Sites[i])$max.val);ymaj=c(1,10,100);ymin=c(seq(1,10,1),seq(10,100,10),seq(100,1000,100))
xlim.val=c(0,100);by.x=20;xmaj=seq(xlim.val[1],xlim.val[2],by.x);xmin=seq(xlim.val[1],xlim.val[2],by.x/2)
plot(flow~PerExceed,fdc.dat.da,type="n",ylim=ylim.val,xlim=xlim.val,yaxs="i",xaxs="i",yaxt="n",xaxt="n",ylab=NA,xlab=NA,log="y");
abline(h=ymaj,lty=3,col="grey")
with(fdc.dat.da.all,lines(PerExceed,flow,lwd=2))
with(fdc.dat.da.flow,lines(PerExceed,flow,lwd=2,lty=2))
axis_fun(2,ymaj,ymin,format(ymaj,scientific=F),1);box(lwd=1)
axis_fun(1,xmaj,xmin,xmaj,1)
mtext(side=2,line=2,"TP (\u03BCg L\u207B\u00B9)",cex=0.9)
mtext(side=1,line=2,"Percent Exceedance",cex=0.9)
leg.x=80;leg.y=max(ylim.val);legend.text=c("All Flow","Flow")
legend(leg.x,leg.y,legend=legend.text,col=c("black"),lty=c(1,2),lwd=1.5,pt.cex=1.5,ncol=1,cex=0.6,bty="n",y.intersp=1,x.intersp=0.75,xpd=NA,xjust=0.5)
  
xlim.val=date.fun(dates);xmaj=seq(xlim.val[1],xlim.val[2],"15 years");xmin=seq(xlim.val[1],xlim.val[2],"1 years")
plot(meanTP~Date.EST,dat.da,ylim=ylim.val,xlim=xlim.val,yaxt="n",xaxt="n",type="n",ylab=NA,xlab=NA,yaxs="i",log="y")
abline(h=ymaj,v=xmaj,lty=3,col="grey")
with(dat.da,points(Date.EST,meanTP.noflow,pch=21,bg=adjustcolor("indianred1",0.5),cex=1,lwd=0.1))
with(dat.da,points(Date.EST,meanTP.flow,pch=21,bg="dodgerblue1",cex=1,lwd=0.1))
axis_fun(2,ymaj,ymin,format(ymaj),1);box(lwd=1)
axis_fun(1,line=-0.5,xmaj,xmin,format(xmaj,"%m-%Y"),0.8)
mtext(side=1,line=2,"Month-Year",cex=0.9)
leg.x=min(xlim.val);leg.y=max(ylim.val);legend.text=c("Flow","No Flow")
legend(leg.x,leg.y,legend=legend.text,lty=0,pch=21,pt.bg=c("dodgerblue1",adjustcolor("indianred1",0.5)),lwd=0.2,pt.cex=1,ncol=1,cex=0.6,bty="n",y.intersp=1,x.intersp=0.75,xpd=NA,xjust=0)
  
ylim.val=c(0,subset(da.wq.wy.max,SITE==wq.Sites[i])$max.val);by.y=subset(da.wq.wy.max,SITE==wq.Sites[i])$by.val;ymaj=seq(ylim.val[1],ylim.val[2],by.y);ymin=seq(ylim.val[1],ylim.val[2],by.y/2)
xlim.val=c(1979,WY(dates[2]));by.x=10;xmaj=seq(xlim.val[1],xlim.val[2],by.x);xmin=seq(xlim.val[1],xlim.val[2],by.x/by.x)
plot(FWM~WY,dat.WY,ylim=ylim.val,xlim=xlim.val,yaxt="n",xaxt="n",type="n",ylab=NA,xlab=NA,yaxs="i")
abline(h=ymaj,v=xmaj,lty=3,col="grey")
with(dat.WY,pt_line_error(WY,FWM,WSE,2,"dodgerblue",2,21,bg="dodgerblue1",cex=1.5,length=0.03,pt.lwd=0.01))
axis_fun(2,ymaj,ymin,format(ymaj),1);box(lwd=1)
axis_fun(1,line=-0.5,xmaj,xmin,xmaj,0.9)
mtext(side=2,line=2,"FWM TP (\u03BCg L\u207B\u00B9)",cex=0.9)
mtext(side=1,line=2,"Water Year",cex=0.9)
mtext(side=3,line=-0.5,wq.Sites[i],outer=T)


siteloc=data.frame(SITE=c("S331", "S173", "S357", "S332B", "S332C", "S174", "S332D", 
                           "S332DX1", "S176", "S328", "S332", "S175", "G737", "S200", "S177", 
                           "S199", "S178", "S18C", "S197"),
                    Inflow_Area=c("L31N", "L31N", "8.5 SMA", "B-Detention", "C-Detention", "L31W", 
                                  "D-Detention", "L31W", "L31N", "L31W", "L31W", "L31W", "L31W", 
                                  "Frog Pond", "C111", "C111/Aerojet", "C111E", "C111", "C111"),
                    Lat=c(25.6111, 25.6114, 25.60718, 25.549533, 25.515128, 25.48352, 
                          25.482966, 25.483157, 25.482663, 25.463284, 25.421891, 25.417762, 
                          25.418426, 25.44412, 25.402754, 25.403209, 25.4082, 25.330631, 
                          25.287304),
                    Long=c(-80.5093, -80.5097, -80.524492, -80.560579, -80.560194, -80.56377, 
                           -80.563778, -80.571077, -80.562796, -80.573666, -80.590195, -80.573793, 
                           -80.573762, -80.560311, -80.558343, -80.559039, -80.52398, -80.524997, 
                           -80.441821))
