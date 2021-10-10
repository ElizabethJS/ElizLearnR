hist(dat$age2, main="Final Age", xlab="Age Response Code", ylab="Frequency")
table(dat$irsex)
1  2 
91 80 
tab.agesex <- table(dat$irsex, dat$age2)
barplot(tab.agesex,
        main = "Stacked barchart",
        xlab = "Age category", ylab = "Frequency",
        legend.text = rownames(tab.agesex),
        beside = FALSE) # Stacked bars (default)
par("mar")
par(mar=c(1,1,1,1))
par(mfrow=c(3,1))
hist(dat$mjage, main="First use Marijuana", xlab="Age", ylab="Frequency of Age")
hist(dat$cigage, main="First smoked Cigarettes", xlab="Age", ylab="Frequency of Age")
hist(dat$iralcage, main="First tried Alcohol", xlab="Age", ylab="Frequency of Age")
hist(dat$sexatract, main="Sexual Attraction", xlab="Attraction", ylab="Frequency")
dat$sexatract %>% sort() %>% tail()
dat$sexatract <- dat$sexatract %>% na_if(., "99")
hist(dat$sexatract, main="Sexual Attraction", xlab="Attraction", ylab="Frequency")
install.packages("magrittr") # package installations are only needed the first time you use it
install.packages("dplyr")    # alternative installation of the %>%
library(magrittr) # needs to be run every time you start R and want to use %>%
library(dplyr)    # alternatively, this also loads %>%
dat$sexatract <- dat$sexatract %>% na_if(., "99")
hist(dat$sexatract, main="Sexual Attraction", xlab="Attraction", ylab="Frequency")
tab.sexatract <- table(dat$irsex, dat$sexatract)
barplot(tab.sexatract,
        main = "Stacked barchart",
        xlab = "Attraction category", ylab = "Frequency",
        legend.text = rownames(tab.sexatract),
        beside = FALSE) # Stacked bars (default)
hist(dat$speakengl, main="Speak English", xlab="How well", ylab="Frequency")
tab.sexengl <- table(dat$irsex, dat$speakengl)
barplot(tab.sexengl,
        main = "Stacked barchart",
        xlab = "English category", ylab = "Frequency",
        legend.text = rownames(tab.sexengl),
        beside = FALSE) # Stacked bars (default)