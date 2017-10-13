library(ggplot2)

# create a dataset
dt2 <- read.csv("10roadac2012_AnnexureXIV.csv")
View(dt2)

dtsub <- dt2[, -c(1,2,6,10,14,18,22,26)]
View(dtsub)

type=c(rep("2wheel" , 3) , rep("auto" , 3) , rep("cars" ,3) , rep("bus" , 3), rep("trucks" , 3), rep("motor" , 3), rep("other" , 3) )
condition=rep(c( "fatal" , "killed", "injured") , 7)
value=c()
value <- vector("integer" , 21L)
length(type)
length(condition)
length(value)


for(i in 1:ncol(dtsub)){
  dtsub[,i] <- as.integer(dtsub[,i])
} 
#problem of factors total was wrong. RESOLVED

for(i in 1:21){
  
  value[i]= (dtsub[36,i])
  
}

new=data.frame(type,condition,value)
View(new)

# Grouped
ggplot(new, aes(fill=condition, y=value, x=type)) + 
  geom_bar( position="dodge" , stat="identity")+
  labs(y= "no. of accidents" ,
       x= " type of vehicle",
       title ="GROUPED PLOT Different levels of accident by variety of vehicles")

# Stacked
ggplot(new, aes(fill=condition, y=value, x=type)) + 
  geom_bar( stat="identity")+
  labs(y= "no. of accidents" ,
       x= " type of vehicle",
       title ="STACKED PLOT Different levels of accident by variety of vehicles")

#Stacked percentage
ggplot(new, aes(fill=condition, y=value, x=type)) + 
  geom_bar( stat="identity", position="fill")+
  labs(y= "no. of accidents" ,
       x= " type of vehicle",
       title ="STACKED PERCENTAGE Different levels of accident by variety of vehicles")
