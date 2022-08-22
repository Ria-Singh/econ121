//analyzes naming trends in the social security names database (national).
//takes interest in frequency of hilary/hillary before and after clinton elections.

//save output in a log file
log using ssa_names_trends_log,replace

//open dataset
use "https://github.com/tvogl/econ121/raw/main/data/ssa_names.dta",clear

//describe dataset
d

//summarize
sum

//structure of data - look at first 10 observations
list if _n<=10

//keep girl names only, since we are interested in Hilary/Hillary
//quotes because sex is a string variable
tab sex
keep if sex=="F"

//graph counts of Hilary/Hillary, with vertical lines at Clinton elections
twoway (line freq year if name=="Hilary",lcolor(blue)) ///
       (line freq year if name=="Hillary",lcolor(orange)) ///
	   ,xline(1992 2008 2016,lcolor(black)) ///
	    legend(label(1 "Hilary") label(2 "Hillary"))

//close log file and convert to PDF
log close
translate ssa_names_trends.smcl ssa_names_trends.pdf			   
