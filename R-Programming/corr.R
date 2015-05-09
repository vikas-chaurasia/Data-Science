corr<-function(directory,threshold=0)
{
  filelist<-list.files(directory,full.names=TRUE)
  r<-vector()
  for( i in seq_along(filelist))
  {
  
    data<-read.csv(filelist[i])
    temp<-data[!is.na(data$nitrate),]
    temp1<-temp[!is.na(temp$sulfate),]
    nobs=nrow(temp1)
    if( nobs > threshold)
    {
      x<-temp1$nitrate
      y<-temp1$sulfate
      r<-c(r,cor(x,y))
    }
     
  }
return (r)
  
}