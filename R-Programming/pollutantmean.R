pollutantmean<-function(directory,pollutant,id=1:332)
  {
     filelist<-list.files(directory)                       
     data<-data.frame()
          for ( i in id)
               {
                    loc<-paste(directory,filelist[i],sep="/")
                    data<-rbind(data,read.csv(loc))
    
               }
  data_set<-data[,names(data)==pollutant]
  mean(data_set,na.rm=TRUE)
}



