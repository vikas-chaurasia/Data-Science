rankhospital<-function(state,outcome,num="best")
{
  outcome_dat<-read.csv("rprog-data-ProgAssignment3-data/outcome-of-care-measures.csv",colClasses="character")
  ## we can use here na.strings="Not Available" and columns factor false to get numeric columns
  if(! state %in% unique(outcome_dat$State))
    stop ("invalid state")
  logical<-grep(outcome,c("heart attack","heart failure","pneumonia"),ignore.case=TRUE)
  if(length(logical)==0)
    stop ("invalid outcome")
  else
  {
    if(logical==1)
      i<-11 
    else
      if(logical==2)
        i<-17
    else
      if(logical==3)
        i<-23
  }
  data<-outcome_dat[outcome_dat$State==state,] 
  data_1<-suppressWarnings(data[!is.na(as.numeric(data[,i])),])
  data_2<-data_1[order(as.numeric(as.character(data_1[,i])),data_1$Hospital.Name,na.last=TRUE),]
  if( num=="worst")
    return (data_2[nrow(data_2),names(data_2)=="Hospital.Name"])
  if ( num=="best")
    return ( data_2[1,names(data_2)=="Hospital.Name"])
  if ( num > nrow(data_2)){
    return (NA)}
  else{
    return ( data_2[num,names(data_2)=="Hospital.Name"])}
  
}