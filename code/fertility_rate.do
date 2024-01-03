use "/Users/tarinisudhakar/Downloads/cps_00012.dta"

save empdata

clear all

use empdata

*gen niu = empstat == 00

gen emp_work = empstat == 10
gen emp_lastweek = empstat == 12
gen emp = emp_work == 1  |  emp_lastweek == 1

gen unemp_exp = empstat == 21
gen unemp_new = empstat == 22
gen unemp = unemp_exp == 1  |  unemp_new == 1

gen ilf = labforce == 2

collapse (sum) emp (sum) unemp (sum) ilf [iweight = wtfinl], by (year month statefip)

gen unemp_rate = (unemp/ilf)*100


clear 
use "/Users/tarinisudhakar/Downloads/cps_00020.dta" 
save unemp_all1

* age and educ
use unemp_all1

gen emp_work = empstat == 10
gen emp_lastweek = empstat == 12
gen emp = emp_work == 1  |  emp_lastweek == 1

gen unemp_exp = empstat == 21
gen unemp_new = empstat == 22
gen unemp = unemp_exp == 1  |  unemp_new == 1

gen ilf = labforce == 2

gen male = sex == 1
gen female = sex == 2

*Sex conditions
gen unemp_male = male == 1 & unemp == 1
gen unemp_female = female == 1 & unemp == 1
gen female_ilf = female == 1 & ilf == 1
gen male_ilf = male == 1 & ilf == 1

*Education dummies 
gen none_preschool_kindergarten = educ == 002
gen grades_1or2or3or4 = educ == 010
gen grades_5or6 = educ == 020
gen grades_7or8 = educ == 030
gen grades_9 = educ == 040
gen grades_10 = educ == 050
gen grades_11 = educ == 060
gen grades_12_no_diploma = educ == 071
*gen grades_12_diploma_unclear = educ == 072
gen grades_12_GED_equi = educ == 073
gen one_year_coll_no_degree = educ == 081
gen two_years_coll_assc_vocation = educ == 091
gen two_years_coll_assc_acad = educ == 092
gen bachelors_degree = educ == 111
gen masters_degree = educ == 123
gen prof_school_degree = educ == 124
gen doc_degree = educ == 125

*Education conditions
gen unemp_none_pre_kg = unemp == 1 & none_preschool_kindergarten == 1
gen unemp_grades_1or2or3or4 = unemp == 1 & grades_1or2or3or == 1
gen unemp_grades_5or6 = unemp == 1 & grades_5or6 == 1
gen unemp_grades_7or8 = unemp == 1 & grades_7or8 == 1
gen unemp_grades_9 = unemp == 1 & grades_9 == 1
gen unemp_grades_10 = unemp == 1 & grades_10 == 1 
gen unemp_grades_11 = unemp == 1 & grades_11 == 1
gen unemp_grades_12_no_diploma = unemp == 1 & grades_12_no_diploma == 1
*gen unemp_grades_12_diploma_unclear = unemp == 1 & grades_12_diploma_unclear == 1
gen unemp_grades_12_GED_equi = unemp == 1 & grades_12_GED_equi == 1
gen unemp_some_no_degree = unemp == 1 & one_year_coll_no_degree == 1
gen unemp_associates_vocation = unemp == 1 & two_years_coll_assc_vocation == 1
gen unemp_associates_academic = unemp == 1 & two_years_coll_assc_acad == 1
gen unemp_bachelors_degree = unemp == 1 & bachelors_degree == 1
gen unemp_masters_degree = unemp == 1 & masters_degree == 1
gen unemp_prof_school_degree = unemp == 1 & prof_school_degree == 1
gen unemp_doc_degree = unemp == 1 & doc_degree == 1


gen ilf_none_pre_kg = ilf == 1 & none_preschool_kindergarten == 1
gen ilf_grades_1or2or3or4 = ilf == 1 & grades_1or2or3or == 1
gen ilf_grades_5or6 = ilf == 1 & grades_5or6 == 1
gen ilf_grades_7or8 = ilf == 1 & grades_7or8 == 1
gen ilf_grades_9 = ilf == 1 & grades_9 == 1
gen ilf_grades_10 = ilf == 1 & grades_10 == 1 
gen ilf_grades_11 = ilf == 1 & grades_11 == 1
gen ilf_grades_12_no_diploma = ilf == 1 & grades_12_no_diploma == 1
*gen ilf_grades_12_diploma_unclear = ilf == 1 & grades_12_diploma_unclear == 1
gen ilf_grades_12_GED_equi = ilf == 1 & grades_12_GED_equi == 1
gen ilf_some_no_degree = ilf == 1 & one_year_coll_no_degree == 1
gen ilf_associates_vocation = ilf == 1 & two_years_coll_assc_vocation == 1
gen ilf_associates_academic = ilf == 1 & two_years_coll_assc_acad == 1
gen ilf_bachelors_degree = ilf == 1 & bachelors_degree == 1
gen ilf_masters_degree = ilf == 1 & masters_degree == 1
gen ilf_prof_school_degree = ilf == 1 & prof_school_degree == 1
gen ilf_doc_degree = ilf == 1 & doc_degree == 1


*Age dummies 
gen under_fifteen = age < 15
gen fifteen = age == 15
gen sixteen = age == 16
gen seventeen = age == 17
gen eighteen = age == 18
gen nineteen = age == 19
gen twenty_to_twentyfour = age >= 20 & age < 25
gen twentyfive_to_twentynine = age >= 25 & age < 30
gen thirty_to_thirtyfour = age >= 30 & age < 35
gen thirtyfive_to_thirtynine = age >= 35 & age < 40
gen forty_to_fortyfour = age >= 40 & age < 45
gen fortyfive_to_fortynine = age >= 45 & age < 50
gen over50 = age >= 50 

*Age conditions
gen unemp_under_fifteen = unemp == 1 & under_fifteen == 1
gen unemp_fifteen = unemp == 1 & fifteen == 1
gen unemp_sixteen = unemp == 1 & sixteen == 1
gen unemp_seventeen = unemp == 1 & seventeen == 1
gen unemp_eighteen = unemp == 1 & eighteen == 1
gen unemp_nineteen = unemp == 1 & nineteen == 1
gen unemp_twenty_to_twentyfour = unemp == 1 & twenty_to_twentyfour == 1
gen unemp_twentyfive_to_twentynine = unemp == 1 & twentyfive_to_twentynine == 1
gen unemp_thirty_to_thirtyfour = unemp == 1 & thirty_to_thirtyfour == 1
gen unemp_thirtyfive_to_thirtynine = unemp == 1 & thirtyfive_to_thirtynine == 1
gen unemp_forty_to_fortyfour = unemp == 1 & forty_to_fortyfour == 1
gen unemp_fortyfive_to_fortynine = unemp == 1 & fortyfive_to_fortynine == 1
gen unemp_over50 = unemp == 1 & over50 == 1


gen ilf_under_fifteen = ilf == 1 & under_fifteen == 1
gen ilf_fifteen = ilf == 1 & fifteen == 1
gen ilf_sixteen = ilf == 1 & sixteen == 1
gen ilf_seventeen = ilf == 1 & seventeen == 1
gen ilf_eighteen = ilf == 1 & eighteen == 1
gen ilf_nineteen = ilf == 1 & nineteen == 1
gen ilf_twenty_to_twentyfour = ilf == 1 & twenty_to_twentyfour == 1
gen ilf_twentyfive_to_twentynine = ilf == 1 & twentyfive_to_twentynine == 1
gen ilf_thirty_to_thirtyfour = ilf == 1 & thirty_to_thirtyfour == 1
gen ilf_thirtyfive_to_thirtynine = ilf == 1 & thirtyfive_to_thirtynine == 1
gen ilf_forty_to_fortyfour = ilf == 1 & forty_to_fortyfour == 1
gen ilf_fortyfive_to_fortynine = ilf == 1 & fortyfive_to_fortynine == 1
gen ilf_over50 = ilf == 1 & over50 == 1


*collapse (sum) emp (sum) unemp (sum) ilf (sum) unemp_male (sum) unemp_female (sum) female_ilf (sum) male_ilf [iweight = wtfinl], by (year month statefip)

collapse  (sum) emp ///
		  (sum) unemp ///
		  (sum) ilf ///
          (sum) unemp_male (sum) unemp_female ///
          (sum) female_ilf (sum) male_ilf ///
          (sum) unemp_none_pre_kg ///
          (sum) unemp_grades_1or2or3or4 ///
          (sum) unemp_grades_5or6 ///
          (sum) unemp_grades_7or8 ///
          (sum) unemp_grades_9 ///
          (sum) unemp_grades_10 ///
          (sum) unemp_grades_11 ///
          (sum) unemp_grades_12_no_diploma ///
		  (sum) unemp_grades_12_GED_equi ///
          (sum) unemp_some_no_degree ///
          (sum) unemp_associates_vocation ///
		  (sum) unemp_associates_academic ///
          (sum) unemp_bachelors_degree ///
          (sum) unemp_masters_degree ///
          (sum) unemp_prof_school_degree ///
          (sum) unemp_doc_degree ///
          (sum) ilf_none_pre_kg ///
          (sum) ilf_grades_1or2or3or4 ///
          (sum) ilf_grades_5or6 ///
          (sum) ilf_grades_7or8 ///
          (sum) ilf_grades_9 ///
          (sum) ilf_grades_10 ///
          (sum) ilf_grades_11 ///
          (sum) ilf_grades_12_no_diploma ///
		  (sum) ilf_grades_12_GED_equi ///
          (sum) ilf_some_no_degree ///
          (sum) ilf_associates_vocation ///
		  (sum) ilf_associates_academic ///
          (sum) ilf_bachelors_degree ///
          (sum) ilf_masters_degree ///
          (sum) ilf_prof_school_degree ///
          (sum) ilf_doc_degree /// 
		  (sum) unemp_under_fifteen ///
		  (sum) unemp_fifteen ///
		  (sum) unemp_sixteen ///
		  (sum) unemp_seventeen ///
		  (sum) unemp_eighteen ///
		  (sum) unemp_nineteen ///
		  (sum) unemp_twenty_to_twentyfour ///
		  (sum) unemp_twentyfive_to_twentynine ///
		  (sum) unemp_thirty_to_thirtyfour ///
		  (sum) unemp_thirtyfive_to_thirtynine ///
		  (sum) unemp_forty_to_fortyfour ///
		  (sum) unemp_fortyfive_to_fortynine ///
		  (sum) unemp_over50 ///
		  (sum) ilf_under_fifteen ///
		  (sum) ilf_fifteen ///
		  (sum) ilf_sixteen ///
		  (sum) ilf_seventeen ///
		  (sum) ilf_eighteen ///
		  (sum) ilf_nineteen ///
		  (sum) ilf_twenty_to_twentyfour /// 
		  (sum) ilf_twentyfive_to_twentynine ///
		  (sum) ilf_thirty_to_thirtyfour ///
		  (sum) ilf_thirtyfive_to_thirtynine ///
		  (sum) ilf_forty_to_fortyfour /// 
		  (sum) ilf_fortyfive_to_fortynine ///
		  (sum) ilf_over50 [iweight = wtfinl], by (year month statefip)



use "/Users/tarinisudhakar/Downloads/cps_00021.dta" 
save aincome3

clear 

use aincome3

keep if inctot < 999999998 
keep if incwage < 999999998

*Sex dummies
gen male = sex == 1
gen female = sex == 2

*Education dummies 
gen none_preschool_kindergarten = educ == 002
gen grades_1or2or3or4 = educ == 010
gen grades_5or6 = educ == 020
gen grades_7or8 = educ == 030
gen grades_9 = educ == 040
gen grades_10 = educ == 050
gen grades_11 = educ == 060
*gen grades_12 = educ == 071 | educ == 072 | educ == 073
gen grades_12_no_diploma = educ == 071
*gen grades_12_diploma_unclear = educ == 072
gen grades_12_GED_equi = educ == 073
gen one_year_coll_no_degree = educ == 081
*gen two_years_coll_associate_degree = educ == 090 | educ == 091
gen two_years_coll_assc_vocation = educ == 091
gen two_years_coll_assc_acad = educ == 092
gen bachelors_degree = educ == 111
gen masters_degree = educ == 123
gen prof_school_degree = educ == 124
gen doc_degree = educ == 125


*Age dummies 
gen under_fifteen = age < 15
gen fifteen = age == 15
gen sixteen = age == 16
gen seventeen = age == 17
gen eighteen = age == 18
gen nineteen = age == 19
gen twenty_to_twentyfour = age >= 20 & age < 25
gen twentyfive_to_twentynine = age >= 25 & age < 30
gen thirty_to_thirtyfour = age >= 30 & age < 35
gen thirtyfive_to_thirtynine = age >= 35 & age < 40
gen forty_to_fortyfour = age >= 40 & age < 45
gen fortyfive_to_fortynine = age >= 45 & age < 50
gen over50 = age >= 50 

*Sex Conditions
gen female_inc = inctot if female == 1
gen male_inc = inctot if male == 1
*gen female_incwage = incwage if female == 1
*gen male_incwage = incwage if male == 1

*Education Conditions
gen none_pre_kg_inc = inctot if none_preschool_kindergarten == 1
gen grades_1or2or3or4_inc = inctot if grades_1or2or3or4 == 1
gen grades_5or6_inc = inctot if grades_5or6 == 1
gen grades_7or8_inc = inctot if grades_7or8 == 1
gen grades_9_inc = inctot if grades_9 == 1
gen grades_10_inc = inctot if grades_10 == 1
gen grades_11_inc = inctot if grades_11 == 1
gen grades_12_no_diploma_inc = inctot if grades_12_no_diploma == 1
*gen grades_12_diploma_unclear_inc = inctot if grades_12_diploma_unclear == 1
gen grades_12_GED_equi_inc = inctot if grades_12_GED_equi == 1
gen some_no_degree_inc = inctot if one_year_coll_no_degree == 1
gen associates_vocation_inc = inctot if two_years_coll_assc_vocation == 1
gen associates_academic_inc = inctot if two_years_coll_assc_acad == 1
gen bachelors_degree_inc = inctot if bachelors_degree == 1
gen masters_degree_inc = inctot if masters_degree == 1
gen prof_school_degree_inc = inctot if prof_school_degree == 1
gen doc_degree_inc = inctot if doc_degree == 1

*Age conditions  
gen under_fifteen_inc = inctot if under_fifteen == 1
gen fifteen_inc = inctot if fifteen == 1
gen sixteen_inc = inctot if sixteen == 1
gen seventeen_inc = inctot if seventeen == 1
gen eighteen_inc = inctot if eighteen == 1
gen nineteen_inc = inctot if nineteen == 1
gen twenty_to_twentyfour_inc = inctot if twenty_to_twentyfour == 1
gen twentyfive_to_twentynine_inc = inctot if twentyfive_to_twentynine == 1
gen thirty_to_thirtyfour_inc = inctot if thirty_to_thirtyfour == 1
gen thirtyfive_to_thirtynine_inc = inctot if thirtyfive_to_thirtynine == 1
gen forty_to_fortyfour_inc = inctot if forty_to_fortyfour == 1
gen fortyfive_to_fortynine_inc = inctot if fortyfive_to_fortynine == 1
gen over50_inc = inctot if over50 == 1


*collapse (mean) female_income (mean) male_income (mean) [iweight = asecwt], by (year statefip)

collapse (mean) inctot ///
		 (mean) female_inc ///
		 (mean) male_inc ///
		 (mean) none_pre_kg_inc ///
		 (mean) grades_1or2or3or4_inc ///
		 (mean) grades_5or6_inc ///
		 (mean) grades_7or8_inc ///
		 (mean) grades_9_inc ///
		 (mean) grades_10_inc ///
		 (mean) grades_11_inc ///
		 (mean) grades_12_no_diploma_inc ///
		 (mean) grades_12_GED_equi_inc ///
		 (mean) some_no_degree_inc ///
		 (mean) associates_vocation_inc ///
		 (mean) associates_academic_inc ///
		 (mean) bachelors_degree_inc ///
		 (mean) masters_degree_inc ///
		 (mean) prof_school_degree_inc ///
		 (mean) doc_degree_inc ///
		 (mean) under_fifteen_inc ///
		 (mean) fifteen_inc ///
		 (mean) sixteen_inc ///
		 (mean) seventeen_inc ///
		 (mean) eighteen_inc ///
		 (mean) nineteen_inc ///
		 (mean) twenty_to_twentyfour_inc ///
		 (mean) twentyfive_to_twentynine_inc ///
		 (mean) thirty_to_thirtyfour_inc ///
		 (mean) thirtyfive_to_thirtynine_inc ///
		 (mean) forty_to_fortyfour_inc ///
		 (mean) fortyfive_to_fortynine_inc ///
		 (mean) over50_inc [iweight = asecwt], by (year statefip)


		 
clear 
use "/Users/tarinisudhakar/Downloads/cps_00022.dta" 
save earn

clear 

use earn

clear
use "/Users/tarinisudhakar/Downloads/cps_00026.dta" 
save earnwt3

use earnwt3

keep if earnweek2 != 9999.99 

*Sex dummies
gen male = sex == 1
gen female = sex == 2

*Education dummies 
gen none_preschool_kindergarten = educ == 002
gen grades_1or2or3or4 = educ == 010
gen grades_5or6 = educ == 020
gen grades_7or8 = educ == 030
gen grades_9 = educ == 040
gen grades_10 = educ == 050
gen grades_11 = educ == 060
*gen grades_12 = educ == 071 | educ == 072 | educ == 073
gen grades_12_no_diploma = educ == 071
*gen grades_12_diploma_unclear = educ == 072
gen grades_12_GED_equi = educ == 073
gen one_year_coll_no_degree = educ == 081
*gen two_years_coll_associate_degree = educ == 090 | educ == 091
gen two_years_coll_assc_vocation = educ == 091
gen two_years_coll_assc_acad = educ == 092
gen bachelors_degree = educ == 111
gen masters_degree = educ == 123
gen prof_school_degree = educ == 124
gen doc_degree = educ == 125


*Age dummies 
gen under_fifteen = age < 15
gen fifteen = age == 15
gen sixteen = age == 16
gen seventeen = age == 17
gen eighteen = age == 18
gen nineteen = age == 19
gen twenty_to_twentyfour = age >= 20 & age < 25
gen twentyfive_to_twentynine = age >= 25 & age < 30
gen thirty_to_thirtyfour = age >= 30 & age < 35
gen thirtyfive_to_thirtynine = age >= 35 & age < 40
gen forty_to_fortyfour = age >= 40 & age < 45
gen fortyfive_to_fortynine = age >= 45 & age < 50
gen over50 = age >= 50 

***********
*Sex Conditions
gen female_inc = earnweek2 if female == 1
gen male_inc = earnweek2 if male == 1
*gen female_incwage = incwage if female == 1
*gen male_incwage = incwage if male == 1

*Education Conditions
gen none_pre_kg_inc = earnweek2 if none_preschool_kindergarten == 1
gen grades_1or2or3or4_inc = earnweek2 if grades_1or2or3or4 == 1
gen grades_5or6_inc = earnweek2 if grades_5or6 == 1
gen grades_7or8_inc = earnweek2 if grades_7or8 == 1
gen grades_9_inc = earnweek2 if grades_9 == 1
gen grades_10_inc = earnweek2 if grades_10 == 1
gen grades_11_inc = earnweek2 if grades_11 == 1
gen grades_12_no_diploma_inc = earnweek2 if grades_12_no_diploma == 1
*gen grades_12_diploma_unclear_inc = inctot if grades_12_diploma_unclear == 1
gen grades_12_GED_equi_inc = earnweek2 if grades_12_GED_equi == 1
gen some_no_degree_inc = earnweek2 if one_year_coll_no_degree == 1
gen associates_vocation_inc = earnweek2 if two_years_coll_assc_vocation == 1
gen associates_academic_inc = earnweek2 if two_years_coll_assc_acad == 1
gen bachelors_degree_inc = earnweek2 if bachelors_degree == 1
gen masters_degree_inc = earnweek2 if masters_degree == 1
gen prof_school_degree_inc = earnweek2 if prof_school_degree == 1
gen doc_degree_inc = earnweek2 if doc_degree == 1

*Age conditions  
gen under_fifteen_inc = earnweek2 if under_fifteen == 1
gen fifteen_inc = earnweek2 if fifteen == 1
gen sixteen_inc = earnweek2 if sixteen == 1
gen seventeen_inc = earnweek2 if seventeen == 1
gen eighteen_inc = earnweek2 if eighteen == 1
gen nineteen_inc = earnweek2 if nineteen == 1
gen twenty_to_twentyfour_inc = earnweek2 if twenty_to_twentyfour == 1
gen twentyfive_to_twentynine_inc = earnweek2 if twentyfive_to_twentynine == 1
gen thirty_to_thirtyfour_inc = earnweek2 if thirty_to_thirtyfour == 1
gen thirtyfive_to_thirtynine_inc = earnweek2 if thirtyfive_to_thirtynine == 1
gen forty_to_fortyfour_inc = earnweek2 if forty_to_fortyfour == 1
gen fortyfive_to_fortynine_inc = earnweek2 if fortyfive_to_fortynine == 1
gen over50_inc = earnweek2 if over50 == 1


*collapse (mean) female_income (mean) male_income (mean) [iweight = asecwt], by (year statefip)
*********

**********
collapse (mean) earnweek2 ///
		 (mean) female_inc ///
		 (mean) male_inc ///
		 (mean) none_pre_kg_inc ///
		 (mean) grades_1or2or3or4_inc ///
		 (mean) grades_5or6_inc ///
		 (mean) grades_7or8_inc ///
		 (mean) grades_9_inc ///
		 (mean) grades_10_inc ///
		 (mean) grades_11_inc ///
		 (mean) grades_12_no_diploma_inc ///
		 (mean) grades_12_GED_equi_inc ///
		 (mean) some_no_degree_inc ///
		 (mean) associates_vocation_inc ///
		 (mean) associates_academic_inc ///
		 (mean) bachelors_degree_inc ///
		 (mean) masters_degree_inc ///
		 (mean) prof_school_degree_inc ///
		 (mean) doc_degree_inc ///
		 (mean) under_fifteen_inc ///
		 (mean) fifteen_inc ///
		 (mean) sixteen_inc ///
		 (mean) seventeen_inc ///
		 (mean) eighteen_inc ///
		 (mean) nineteen_inc ///
		 (mean) twenty_to_twentyfour_inc ///
		 (mean) twentyfive_to_twentynine_inc ///
		 (mean) thirty_to_thirtyfour_inc ///
		 (mean) thirtyfive_to_thirtynine_inc ///
		 (mean) forty_to_fortyfour_inc ///
		 (mean) fortyfive_to_fortynine_inc ///
		 (mean) over50_inc [iweight = earnwt], by (year month statefip)

		 
clear
use "/Users/tarinisudhakar/Downloads/cps_00023.dta" 
save pop_educ

* sex and educ
use pop_educ

*Sex dummies
gen male = sex == 1
gen female = sex == 2

*Education dummies 
gen none_preschool_kindergarten = educ == 002
gen grades_1or2or3or4 = educ == 010
gen grades_5or6 = educ == 020
gen grades_7or8 = educ == 030
gen grades_9 = educ == 040
gen grades_10 = educ == 050
gen grades_11 = educ == 060
*gen grades_12 = educ == 071 | educ == 072 | educ == 073
gen grades_12_no_diploma = educ == 071
*gen grades_12_diploma_unclear = educ == 072
gen grades_12_GED_equi = educ == 073
gen one_year_coll_no_degree = educ == 081
*gen two_years_coll_associate_degree = educ == 090 | educ == 091
gen two_years_coll_assc_vocation = educ == 091
gen two_years_coll_assc_acad = educ == 092
gen bachelors_degree = educ == 111
gen masters_degree = educ == 123
gen prof_school_degree = educ == 124
gen doc_degree = educ == 125


*Education conditions 
gen none_pre_kg_female = female == 1 & none_preschool_kindergarten == 1
gen grades_1or2or3or4_female = female == 1 & grades_1or2or3or4 == 1
gen grades_5or6_female = female == 1 & grades_5or6 == 1
gen grades_7or8_female = female == 1 & grades_7or8 == 1
gen grades_9_female = female == 1 & grades_9 == 1
gen grades_10_female = female == 1 & grades_10 == 1
gen grades_11_female = female == 1 & grades_11 == 1
gen grades_12_no_diploma_female = female == 1 & grades_12_no_diploma == 1
*gen grades_12_diploma_unclear_inc = inctot if grades_12_diploma_unclear == 1
gen grades_12_GED_equi_female = female == 1 & grades_12_GED_equi == 1
gen some_no_degree_female = female == 1 & one_year_coll_no_degree == 1
gen associates_vocation_female = female == 1 & two_years_coll_assc_vocation == 1
gen associates_academic_female = female == 1 & two_years_coll_assc_acad == 1
gen bachelors_degree_female = female == 1 & bachelors_degree == 1
gen masters_degree_female = female == 1 & masters_degree == 1
gen prof_school_degree_female = female == 1 & prof_school_degree == 1
gen doc_degree_female = female == 1 & doc_degree == 1

gen none_pre_kg_male = male == 1 & none_preschool_kindergarten == 1
gen grades_1or2or3or4_male = male == 1 & grades_1or2or3or4 == 1
gen grades_5or6_male = male == 1 & grades_5or6 == 1
gen grades_7or8_male = male == 1 & grades_7or8 == 1
gen grades_9_male = male == 1 & grades_9 == 1
gen grades_10_male = male == 1 & grades_10 == 1
gen grades_11_male = male == 1 & grades_11 == 1
gen grades_12_no_diploma_male = male == 1 & grades_12_no_diploma == 1
*gen grades_12_diploma_unclear_inc = inctot if grades_12_diploma_unclear == 1
gen grades_12_GED_equi_male = male == 1 & grades_12_GED_equi == 1
gen some_no_degree_male = male == 1 & one_year_coll_no_degree == 1
gen associates_vocation_male = male == 1 & two_years_coll_assc_vocation == 1
gen associates_academic_male = male == 1 & two_years_coll_assc_acad == 1
gen bachelors_degree_male = male == 1 & bachelors_degree == 1
gen masters_degree_male = male == 1 & masters_degree == 1
gen prof_school_degree_male = male == 1 & prof_school_degree == 1
gen doc_degree_male = male == 1 & doc_degree == 1


collapse (sum) none_pre_kg_female ///
		 (sum) grades_1or2or3or4_female ///
		 (sum) grades_5or6_female ///
		 (sum) grades_7or8_female ///
		 (sum) grades_9_female ///
		 (sum) grades_10_female ///
		 (sum) grades_11_female ///
		 (sum) grades_12_no_diploma_female ///
		 (sum) grades_12_GED_equi_female ///
		 (sum) some_no_degree_female ///
		 (sum) associates_vocation_female ///
		 (sum) associates_academic_female ///
		 (sum) bachelors_degree_female ///
		 (sum) masters_degree_female ///
		 (sum) prof_school_degree_female ///
		 (sum) doc_degree_female ///
		 (sum) none_pre_kg_male ///
		 (sum) grades_1or2or3or4_male ///
		 (sum) grades_5or6_male ///
		 (sum) grades_7or8_male ///
		 (sum) grades_9_male ///
		 (sum) grades_10_male ///
		 (sum) grades_11_male ///
		 (sum) grades_12_no_diploma_male ///
		 (sum) grades_12_GED_equi_male ///
		 (sum) some_no_degree_male ///
		 (sum) associates_vocation_male ///
		 (sum) associates_academic_male ///
		 (sum) bachelors_degree_male ///
		 (sum) masters_degree_male ///
		 (sum) prof_school_degree_male ///
		 (sum) doc_degree_male [iweight = wtfinl], by (year month statefip)

		 
clear
use "/Users/tarinisudhakar/Downloads/cps_00024.dta" 
save pop_age

* sex and educ
use pop_age


*Sex dummies
gen male = sex == 1
gen female = sex == 2

*Age conditions 
gen fifteen_female = female == 1 & age == 15
gen sixteen_female  = female == 1 & age == 16
gen seventeen_female  = female == 1 & age == 17
gen eighteen_female  = female == 1 & age == 18
gen nineteen_female  = female == 1 & age == 19
gen twenty_female  = female == 1 & age == 20
gen twentyone_female  = female == 1 & age == 21
gen twentytwo_female  = female == 1 & age == 22
gen twentythree_female  = female == 1 & age == 23
gen twentyfour_female  = female == 1 & age == 24
gen twentyfive_female  = female == 1 & age == 25
gen twentysix_female  = female == 1 & age == 26
gen twentyseven_female  = female == 1 & age == 27
gen twentyeight_female  = female == 1 & age == 28
gen twentynine_female  = female == 1 & age == 29
gen thirty_female  = female == 1 & age == 30
gen thirtyone_female  = female == 1 & age == 31
gen thirtytwo_female  = female == 1 & age == 32
gen thirtythree_female  = female == 1 & age == 33
gen thirtyfour_female  = female == 1 & age == 34
gen thirtyfive_female  = female == 1 & age == 35
gen thirtysix_female  = female == 1 & age == 36
gen thirtyseven_female  = female == 1 & age == 37
gen thirtyeight_female  = female == 1 & age == 38
gen thirtynine_female  = female == 1 & age == 39
gen forty_female  = female == 1 & age == 40
gen fortyone_female  = female == 1 & age == 41
gen fortytwo_female  = female == 1 & age == 42
gen fortythree_female  = female == 1 & age == 43
gen fortyfour_female  = female == 1 & age == 44
gen fortyfive_female  = female == 1 & age == 45
gen fortysix_female  = female == 1 & age == 46
gen fortyseven_female  = female == 1 & age == 47
gen fortyeight_female  = female == 1 & age == 48
gen fortynine_female  = female == 1 & age == 49
gen fifty_female = female == 1 & age == 50


gen fifteen_male = male == 1 & age == 15
gen sixteen_male = male == 1 & age == 16
gen seventeen_male = male == 1 & age == 17
gen eighteen_male = male == 1 & age == 18
gen nineteen_male = male == 1 & age == 19
gen twenty_male = male == 1 & age == 20
gen twentyone_male = male == 1 & age == 21
gen twentytwo_male = male == 1 & age == 22
gen twentythree_male = male == 1 & age == 23
gen twentyfour_male = male == 1 & age == 24
gen twentyfive_male = male == 1 & age == 25
gen twentysix_male = male == 1 & age == 26
gen twentyseven_male = male == 1 & age == 27
gen twentyeight_male = male == 1 & age == 28
gen twentynine_male = male == 1 & age == 29
gen thirty_male = male == 1 & age == 30
gen thirtyone_male = male == 1 & age == 31
gen thirtytwo_male = male == 1 & age == 32
gen thirtythree_male = male == 1 & age == 33
gen thirtyfour_male = male == 1 & age == 34
gen thirtyfive_male = male == 1 & age == 35
gen thirtysix_male = male == 1 & age == 36
gen thirtyseven_male = male == 1 & age == 37
gen thirtyeight_male = male == 1 & age == 38
gen thirtynine_male = male == 1 & age == 39
gen forty_male = male == 1 & age == 40
gen fortyone_male = male == 1 & age == 41
gen fortytwo_male = male == 1 & age == 42
gen fortythree_male = male == 1 & age == 43
gen fortyfour_male = male == 1 & age == 44
gen fortyfive_male = male == 1 & age == 45
gen fortysix_male = male == 1 & age == 46
gen fortyseven_male = male == 1 & age == 47
gen fortyeight_male = male == 1 & age == 48
gen fortynine_male  = male == 1 & age == 49
gen fifty_male = male == 1 & age == 50


collapse (sum) fifteen_female ///
		 (sum) sixteen_female ///
		 (sum) seventeen_female ///
		 (sum) eighteen_female ///
		 (sum) nineteen_female ///
		 (sum) twenty_female ///
		 (sum) twentyone_female ///
		 (sum) twentytwo_female ///
		 (sum) twentythree_female ///
		 (sum) twentyfour_female ///
		 (sum) twentyfive_female ///
		 (sum) twentysix_female ///
		 (sum) twentyseven_female ///
		 (sum) twentyeight_female ///
		 (sum) twentynine_female ///
		 (sum) thirty_female ///
		 (sum) thirtyone_female ///
		 (sum) thirtytwo_female ///
		 (sum) thirtythree_female ///
		 (sum) thirtyfour_female ///
		 (sum) thirtyfive_female ///
		 (sum) thirtysix_female ///
		 (sum) thirtyseven_female ///
		 (sum) thirtyeight_female ///
		 (sum) thirtynine_female ///
		 (sum) forty_female ///
		 (sum) fortyone_female ///
		 (sum) fortytwo_female ///
		 (sum) fortythree_female ///
		 (sum) fortyfour_female ///
		 (sum) fortyfive_female ///
		 (sum) fortysix_female ///
		 (sum) fortyseven_female///
		 (sum) fortyeight_female ///
		 (sum) fortynine_female ///
		 (sum) fifty_female ///
		 (sum) fifteen_male ///
		 (sum) sixteen_male ///
		 (sum) seventeen_male ///
		 (sum) eighteen_male ///
		 (sum) nineteen_male ///
		 (sum) twenty_male ///
		 (sum) twentyone_male ///
		 (sum) twentytwo_male ///
		 (sum) twentythree_male ///
		 (sum) twentyfour_male ///
		 (sum) twentyfive_male ///
		 (sum) twentysix_male ///
		 (sum) twentyseven_male ///
		 (sum) twentyeight_male ///
		 (sum) twentynine_male ///
		 (sum) thirty_male ///
		 (sum) thirtyone_male ///
		 (sum) thirtytwo_male ///
		 (sum) thirtythree_male ///
		 (sum) thirtyfour_male ///
		 (sum) thirtyfive_male ///
		 (sum) thirtysix_male ///
		 (sum) thirtyseven_male ///
		 (sum) thirtyeight_male ///
		 (sum) thirtynine_male ///
		 (sum) forty_male ///
		 (sum) fortyone_male ///
		 (sum) fortytwo_male ///
		 (sum) fortythree_male ///
		 (sum) fortyfour_male ///
		 (sum) fortyfive_male ///
		 (sum) fortysix_male ///
		 (sum) fortyseven_male///
		 (sum) fortyeight_male ///
		 (sum) fortynine_male ///
		 (sum) fifty_male ///
		 [iweight = wtfinl], by (year month statefip)
