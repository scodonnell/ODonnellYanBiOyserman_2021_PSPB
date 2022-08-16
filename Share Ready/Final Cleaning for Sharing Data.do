use "/Volumes/GoogleDrive/.shortcut-targets-by-id/1HdnUIqJk4xXSTU36ZxZLpE0cred4rkNJ/Difficulty Associations Paper/Study Data and Syntax/Caseys Studies/IATStudiesCombined_Oct 21 2021.dta", clear
replace sss=SSS_1 if(sss==.) 
drop SSS_1

replace genderfinal_afterremerge = 2 if(genderfinal_afterremerge==0) 
replace gender=Gender if(gender==.) 
replace gender=genderfinal_afterremerge if(gender==. & Gender==.) 
replace gender=3 if(gender>=3 & gender!=.) 
drop Gender 
drop genderfinal_afterremerge
tab gender


replace race=Race if(race==.) 

replace race_final_aggregated = 1 if(race==1) 
replace race_final_aggregated = 2 if(race==3) 
replace race_final_aggregated = 3 if(race==2) 
replace race_final_aggregated = 4 if(race==4) 
replace race_final_aggregated = 5 if(race_final_aggregated==.) 
tab race_final_aggregated
drop Race race 


replace educ=Educ if(educ==.) 
drop Educ

replace Gini=gininow if(Gini==.) 
drop gininow 

replace IG = ignow if(IG==.) 
drop ignow 
replace income =Income if(income==.) 
drop Income

replace sample = "study 6" if(sample=="Baseline Colorado Pathways") 
replace sample = "study 3" if(sample=="Original Comparison Study on MTurk") 
replace sample= "study 5" if(sample=="Inequality Replication: social class triad and local context") 
replace sample= "study 4" if(sample=="Replication Comparison Study on MTurk, plus social class triad and local inequality") 

ren a_imposminusimportance a_dscore
ren k_imposminusimportance k_dscore 

replace accuracy=adultaccuracytotal if(accuracy==.) 


replace age=Age if(age==.) 
drop age  

drop if(Age==13825) 

save "/Volumes/GoogleDrive/.shortcut-targets-by-id/1HdnUIqJk4xXSTU36ZxZLpE0cred4rkNJ/Difficulty Associations Paper/Study Data and Syntax/Caseys Studies/Share Ready/Study 3-6 Data.dta", replace 
