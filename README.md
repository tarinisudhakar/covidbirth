# COVID-19 Fertility Rates 

Data collection for paper analyzing fertility rates during COVID-19 pandemic

## Data Sources

  1. COVID: CDC
     1. [COVID Cases](https://data.cdc.gov/Case-Surveillance/Weekly-United-States-COVID-19-Cases-and-Deaths-by-/pwn4-m3yp)
     2. [COVID Hospitalizations](https://data.cdc.gov/Public-Health-Surveillance/Weekly-United-States-COVID-19-Hospitalization-Metr/7dk4-g6vg)
  2. Population: [CPS Basic Monthly](https://www.census.gov/data/datasets/time-series/demo/cps/cps-basic.html)
     1. Population by sex and education
     2. Population by race and sex
     3. Population by age and sex
     4. Used [MDAT](https://data.census.gov/mdat/#/search?ds=CPSBASIC202308) to get initial data; cross-checked with IPUMS CPS
     5. IPUMS CPS Variables: [SEX](https://cps.ipums.org/cps-action/variables/SEX#codes_section), [EDUC](https://cps.ipums.org/cps-action/variables/EDUC#codes_section), [RACE](https://cps.ipums.org/cps-action/variables/RACE#codes_section), [AGE](https://cps.ipums.org/cps-action/variables/AGE#codes_section)
  3. Unemployment: CPS Basic Monthly
     1. Unemployment
     2. In labor force
     3. Unemployment and in labor force by sex
     4. Unemployment and in labor force by education
     5. Unemployment and in labor force by age
     6. Used IPUMS to get data; cross-checked with MDAT
     7. IPUMS CPS Variables: [SEX](https://cps.ipums.org/cps-action/variables/SEX#codes_section), [EDUC](https://cps.ipums.org/cps-action/variables/EDUC#codes_section), [AGE](https://cps.ipums.org/cps-action/variables/AGE#codes_section), [EMPSTAT](https://cps.ipums.org/cps-action/variables/EMPSTAT#codes_section), [LABFORCE](https://cps.ipums.org/cps-action/variables/LABFORCE#codes_section) 
  4. Weekly earnings: [CPS Outgoing Rotation Group](https://cps.ipums.org/cps/outgoing_rotation_notes.shtml)
     1. Earnings by sex
     2. Earnings by education
     3. Earnings by age
     4. Used IPUMS CPS to get data; when I cross-checked with MDAT, their earnings numbers were lower - I think they adjust their data to show real earnings
     5. IPUMS Variable for weekly earnings: [SEX](https://cps.ipums.org/cps-action/variables/SEX#codes_section), [EDUC](https://cps.ipums.org/cps-action/variables/EDUC#codes_section), [AGE](https://cps.ipums.org/cps-action/variables/AGE#codes_section),[EARNWEEK2](https://cps.ipums.org/cps-action/variables/EARNWEEK2#description_section)
    
### Miscellaneous
  1. STATA code for collating IPUMS CPS data [here](https://github.com/tarinisudhakar/covidbirth/blob/main/code/fertility_rate.do)
  2. Python scripts for scraping MDAT [here](https://github.com/tarinisudhakar/covidbirth/blob/main/code/scrape_MDAT.py)
