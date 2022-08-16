library(haven)
#install.packages("rstan")
library(rstan)
library(tidyverse)
#install.packages("bridgesampling")
library(bridgesampling)

install.packages("BayesFactor")
library(BayesFactor)
##read in the data for the studies using the D-AT and subset into indepedent 
##dataframes 



DATStudies<-read_dta("/Volumes/GoogleDrive/.shortcut-targets-by-id/1HdnUIqJk4xXSTU36ZxZLpE0cred4rkNJ/Difficulty Associations Paper/Study Data and Syntax/Caseys Studies/Share Ready/Study 3-6 Data.dta")

#generate accuracy exclusion/binary


study3<-DATStudies%>%
  subset(sample=="study 3" & dscore!="NA")

study3Accurate<-study3%>% 
  subset(inaccurate==0)

study4<-DATStudies%>%
  subset(sample=="study 4" & dscore!="NA")

study4Accurate<-study4%>% 
  subset(inaccurate==0)

study5<-DATStudies%>%
  subset(sample=="study 5" & dscore!="NA")

study5Accurate<-study5%>% 
  subset(inaccurate==0)

study6<-DATStudies%>%
  subset(sample=="study 6" & dscore!="NA")

study6Accurate<-study6%>% 
  subset(inaccurate==0)

############run the models using BayesFactor package, 
#####the interpretation of the result is an r value () and the bayes factor 
####in favor of the null hypothesis. In this set of studies, the bayes factor, 
####does not favor the null, so tends to be close to a value of 0. 

#for each study, I run four commands. One pair refers to the sample 
#when inaccurate responses are included (e.g., m1 and m1_post) vs. the other pair
#that only examines respondents with accuracies
m1<- ttestBF(study3$dscore, mu=0, posterior = FALSE, data=study3 , 
             iterations=2000)

m1_post<- ttestBF(study3$dscore, mu=0, posterior = FALSE, data=study3 , 
             iterations=2000)

m1_accurateonly
m1_accurateonly_posterior

summary(m1)

study3$dscore
?ttestBF

