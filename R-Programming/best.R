best <-function(state,outcome)
{
  
  outcome_dat<-read.csv("rprog-data-ProgAssignment3-data/outcome-of-care-measures.csv",colClasses="character")
  if(!state %in% unique(outcome_dat$State))
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
data_2<-data_1[order(data_1$Hospital.Name,na.last=TRUE),]
min_data<-data_2[as.numeric(as.character(data_2[,i]))==min(as.numeric(data_2[,i])),]

return (min_data$Hospital.Name)


}