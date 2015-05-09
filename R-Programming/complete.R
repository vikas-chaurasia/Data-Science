complete<-function(directory,id=1:332)
{
  filelist<-list.files(directory,full.names=TRUE)
  r<-data.frame()
  for( i in id)
  {
  
    data<-read.csv(filelist[i])
    temp<-data[!is.na(data$nitrate),]
    temp1<-temp[!is.na(temp$sulfate),]
    nobs=nrow(temp1)
    r<-rbind(r,data.frame(id=i,nobs))
     
  }
return (r)
  
}