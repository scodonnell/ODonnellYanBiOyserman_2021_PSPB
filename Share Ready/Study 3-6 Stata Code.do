use "/Volumes/GoogleDrive/.shortcut-targets-by-id/1HdnUIqJk4xXSTU36ZxZLpE0cred4rkNJ/Difficulty Associations Paper/Study Data and Syntax/Caseys Studies/Share Ready/Study 3-6 Data.dta", clear


**exclude based on accuracy

gen inaccurate=0 
replace inaccurate=1 if(accuracy<.75 & accuracy!=.)
save "/Volumes/GoogleDrive/.shortcut-targets-by-id/1HdnUIqJk4xXSTU36ZxZLpE0cred4rkNJ/Difficulty Associations Paper/Study Data and Syntax/Caseys Studies/Share Ready/Study 3-6 Data.dta", replace

bysort sample: tab inaccurate

**Compare dscore to zero (inaccurate responders not included) 

bysort sample: ttest dscore==0 if(inaccurate!=1) 
bysort sample: ttest dscore==0 

**correlations 

bysort sample: pwcorr dscore importavg impossavg gender educ income sss frpl Gini if(inaccurate==1), sig


