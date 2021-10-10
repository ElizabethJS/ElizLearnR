datasets::USArrests
install.packages("datasets")
library("datasetes")
USArrests
dat<-USArrests
dat
dat$state <- tolower(rownames(USArrests))
names(dat)
The variables are murder, assault, urbanpop, rape, and state. 
typeof(data.names(Murder))
typeof(Murder)
class('Murder')
typeof('Murder')
dat
hist(dat$Murder, main="US Arrests for Murder", xlab="Average Arrests", ylab="Frequency of Average Arrests")
mean('Murder')
mean(Murder)
a<-c(13.2, 10.0, 8.1, 8.8, 9.0, 7.9, 3.3, 5.9, 15.4, 17.4, 5.3, 2.6, 10.4, 7.2, 2.2, 6.0, 9.7, 15.4, 2.1, 11.3, 4.4, 12.1, 2.7, 16.1, 9.0, 6.0, 4.3, 12.2, 2.1, 7.4, 11.4, 11.1, 13.0, 0.8, 7.3, 6.6, 4.9, 6.3, 3.4, 14.4, 3.8, 13.2, 12.7, 3.2, 2.2, 8.5, 4.0, 5.7, 2.6, 6.8)
mean(a)
median(a)
b<-c(236, 263, 294, 190, 276, 204, 110, 238, 335, 211, 46, 120, 249, 113, 56, 115, 109, 249, 83, 300, 149, 255, 72, 259, 178, 109, 102, 252, 57, 159, 285, 254, 337, 45, 120, 151, 159, 106, 174, 279, 86, 188, 201, 120, 48, 156, 145, 81, 53, 161)
mean(b)
median(b)
c<-c(21.2, 44.5, 31.0, 19.5, 40.6, 38.7, 11.1, 15.8, 31.9, 25.8, 20.2, 14.2, 24.0, 21.0, 11.3, 18.0, 16.3, 22.2, 7.8, 27.8, 16.3, 35.1, 14.9, 17.1, 28.2, 16.4, 16.5, 46.0, 9.5, 18.8, 32.1, 26.1, 16.1, 7.3, 21.4, 20.0, 29.3, 14.9, 8.3, 22.5, 12.8, 26.9, 25.5, 22.9, 11.2, 20.7, 26.2, 9.3, 10.8, 15.6)
mean(c)
median(c)
hist(dat$Assault, main="US Arrests for Assault", xlab="Average Arrests", ylab="Frequency of Average Arrests")
hist(dat$Rape, main="US Arrests for Rape", xlab="Average Arrests", ylab="Frequency of Average Arrests")
par(mfrow=c(3,1))
?par
par(mfrow=c(3,1))
hist(dat$Murder, main="US Arrests for Murder", xlab="Average Arrests", ylab="Frequency of Average Arrests")
hist(dat$Assault, main="US Arrests for Assault", xlab="Average Arrests", ylab="Frequency of Average Arrests")
hist(dat$Rape, main="US Arrests for Rape", xlab="Average Arrests", ylab="Frequency of Average Arrests")
par("mar")
par(mar=c(1,1,1,1))
par(mfrow=c(3,1))
hist(dat$Murder, main="US Arrests for Murder", xlab="Average Arrests", ylab="Frequency of Average Arrests")
par(mfrow=c(3,1))
hist(dat$Murder, main="US Arrests for Murder", xlab="Average Arrests", ylab="Frequency of Average Arrests")
hist(dat$Assault, main="US Arrests for Assault", xlab="Average Arrests", ylab="Frequency of Average Arrests")
hist(dat$Rape, main="US Arrests for Rape", xlab="Average Arrests", ylab="Frequency of Average Arrests")

library('maps') 
library('ggplot2') 

ggplot(dat, aes(map_id=state, fill=Murder)) + 
  geom_map(map=map_data("state")) + 
  expand_limits(x=map_data("state")$long, y=map_data("state")$lat)

?geom_map(map=map_data("state"))
update.packages(ask = FALSE, checkBuilt = TRUE)
tinytex::tlmgr_update()
class(dat$Murder)