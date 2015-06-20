rankall<-function(outcome,num="best")
{
  outcome_dat<-read.csv("rprog-data-ProgAssignment3-data/outcome-of-care-measures.csv",colClasses="character")
  result<-data.frame()
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
  states<-sort(unique(outcome_dat$State))
  for(state in states)
  {
    data<-outcome_dat[outcome_dat$State==state,] 
    data_1<-suppressWarnings(data[!is.na(as.numeric(data[,i])),])
    data_2<-data_1[order(as.numeric(as.character(data_1[,i])),data_1$Hospital.Name,na.last=TRUE),]
    if( num=="worst"){
      worst<-data.frame(hospital=data_2[nrow(data_2),names(data_2)=="Hospital.Name"],state=state)
      result<-rbind(result,worst)} 
    else {
    if ( num=="best")
    { best<-data.frame(hospital=data_2[1,names(data_2)=="Hospital.Name"],state=state)
      result<-rbind(result,best)
    }
    else{
      rank<-data.frame(hospital=data_2[num,names(data_2)=="Hospital.Name"],state=state)
      result<-rbind(result,rank)
      }
  }
  }
  
  return (result)
}

