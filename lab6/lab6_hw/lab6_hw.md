---
title: "Lab 6 Homework"
author: "Isaac Yag"
date: "2023-01-31"
output:
  html_document: 
    theme: spacelab
    keep_md: yes
---



## Instructions
Answer the following questions and complete the exercises in RMarkdown. Please embed all of your code and push your final work to your repository. Your final lab report should be organized, clean, and run free from errors. Remember, you must remove the `#` for the included code chunks to run. Be sure to add your name to the author header above.  

Make sure to use the formatting conventions of RMarkdown to make your report neat and clean!  

## Load the libraries

```r
library(tidyverse)
library(janitor)
library(skimr)
```

For this assignment we are going to work with a large data set from the [United Nations Food and Agriculture Organization](http://www.fao.org/about/en/) on world fisheries. These data are pretty wild, so we need to do some cleaning. First, load the data.  

Load the data `FAO_1950to2012_111914.csv` as a new object titled `fisheries`.

```r
fisheries <- readr::read_csv(file = "data/FAO_1950to2012_111914.csv")
```

```
## Rows: 17692 Columns: 71
## ── Column specification ────────────────────────────────────────────────────────
## Delimiter: ","
## chr (69): Country, Common name, ISSCAAP taxonomic group, ASFIS species#, ASF...
## dbl  (2): ISSCAAP group#, FAO major fishing area
## 
## ℹ Use `spec()` to retrieve the full column specification for this data.
## ℹ Specify the column types or set `show_col_types = FALSE` to quiet this message.
```

1. Do an exploratory analysis of the data (your choice). What are the names of the variables, what are the dimensions, are there any NA's, what are the classes of the variables?  

```r
names(fisheries)
```

```
##  [1] "Country"                 "Common name"            
##  [3] "ISSCAAP group#"          "ISSCAAP taxonomic group"
##  [5] "ASFIS species#"          "ASFIS species name"     
##  [7] "FAO major fishing area"  "Measure"                
##  [9] "1950"                    "1951"                   
## [11] "1952"                    "1953"                   
## [13] "1954"                    "1955"                   
## [15] "1956"                    "1957"                   
## [17] "1958"                    "1959"                   
## [19] "1960"                    "1961"                   
## [21] "1962"                    "1963"                   
## [23] "1964"                    "1965"                   
## [25] "1966"                    "1967"                   
## [27] "1968"                    "1969"                   
## [29] "1970"                    "1971"                   
## [31] "1972"                    "1973"                   
## [33] "1974"                    "1975"                   
## [35] "1976"                    "1977"                   
## [37] "1978"                    "1979"                   
## [39] "1980"                    "1981"                   
## [41] "1982"                    "1983"                   
## [43] "1984"                    "1985"                   
## [45] "1986"                    "1987"                   
## [47] "1988"                    "1989"                   
## [49] "1990"                    "1991"                   
## [51] "1992"                    "1993"                   
## [53] "1994"                    "1995"                   
## [55] "1996"                    "1997"                   
## [57] "1998"                    "1999"                   
## [59] "2000"                    "2001"                   
## [61] "2002"                    "2003"                   
## [63] "2004"                    "2005"                   
## [65] "2006"                    "2007"                   
## [67] "2008"                    "2009"                   
## [69] "2010"                    "2011"                   
## [71] "2012"
```

```r
dim(fisheries)
```

```
## [1] 17692    71
```

```r
anyNA(fisheries)
```

```
## [1] TRUE
```

```r
class(names(fisheries))
```

```
## [1] "character"
```

2. Use `janitor` to rename the columns and make them easier to use. As part of this cleaning step, change `country`, `isscaap_group_number`, `asfis_species_number`, and `fao_major_fishing_area` to data class factor. 

```r
fisheries <- janitor::clean_names(fisheries)
fisheries
```

```
## # A tibble: 17,692 × 71
##    country common_…¹ issca…² issca…³ asfis…⁴ asfis…⁵ fao_m…⁶ measure x1950 x1951
##    <chr>   <chr>       <dbl> <chr>   <chr>   <chr>     <dbl> <chr>   <chr> <chr>
##  1 Albania Angelsha…      38 Sharks… 10903X… Squati…      37 Quanti… <NA>  <NA> 
##  2 Albania Atlantic…      36 Tunas,… 175010… Sarda …      37 Quanti… <NA>  <NA> 
##  3 Albania Barracud…      37 Miscel… 177100… Sphyra…      37 Quanti… <NA>  <NA> 
##  4 Albania Blue and…      45 Shrimp… 228020… Ariste…      37 Quanti… <NA>  <NA> 
##  5 Albania Blue whi…      32 Cods, … 148040… Microm…      37 Quanti… <NA>  <NA> 
##  6 Albania Bluefish       37 Miscel… 170202… Pomato…      37 Quanti… <NA>  <NA> 
##  7 Albania Bogue          33 Miscel… 170392… Boops …      37 Quanti… <NA>  <NA> 
##  8 Albania Caramote…      45 Shrimp… 228010… Penaeu…      37 Quanti… <NA>  <NA> 
##  9 Albania Catshark…      38 Sharks… 108010… Scylio…      37 Quanti… <NA>  <NA> 
## 10 Albania Common c…      57 Squids… 321020… Sepia …      37 Quanti… <NA>  <NA> 
## # … with 17,682 more rows, 61 more variables: x1952 <chr>, x1953 <chr>,
## #   x1954 <chr>, x1955 <chr>, x1956 <chr>, x1957 <chr>, x1958 <chr>,
## #   x1959 <chr>, x1960 <chr>, x1961 <chr>, x1962 <chr>, x1963 <chr>,
## #   x1964 <chr>, x1965 <chr>, x1966 <chr>, x1967 <chr>, x1968 <chr>,
## #   x1969 <chr>, x1970 <chr>, x1971 <chr>, x1972 <chr>, x1973 <chr>,
## #   x1974 <chr>, x1975 <chr>, x1976 <chr>, x1977 <chr>, x1978 <chr>,
## #   x1979 <chr>, x1980 <chr>, x1981 <chr>, x1982 <chr>, x1983 <chr>, …
```


```r
fisheries <- 
  fisheries %>% mutate(across(c(country, isscaap_group_number, asfis_species_number, fao_major_fishing_area), as_factor))
```

We need to deal with the years because they are being treated as characters and start with an X. We also have the problem that the column names that are years actually represent data. We haven't discussed tidy data yet, so here is some help. You should run this ugly chunk to transform the data for the rest of the homework. It will only work if you have used janitor to rename the variables in question 2!

```r
fisheries_tidy <- fisheries %>% 
  pivot_longer(-c(country,common_name,isscaap_group_number,isscaap_taxonomic_group,asfis_species_number,asfis_species_name,fao_major_fishing_area,measure),
               names_to = "year",
               values_to = "catch",
               values_drop_na = TRUE) %>% 
  mutate(year= as.numeric(str_replace(year, 'x', ''))) %>% 
  mutate(catch= str_replace(catch, c(' F'), replacement = '')) %>% 
  mutate(catch= str_replace(catch, c('...'), replacement = '')) %>% 
  mutate(catch= str_replace(catch, c('-'), replacement = '')) %>% 
  mutate(catch= str_replace(catch, c('0 0'), replacement = ''))

fisheries_tidy$catch <- as.numeric(fisheries_tidy$catch)
```

3. How many countries are represented in the data? Provide a count and list their names.

There are 204 countries.

```r
table(fisheries$country)
```

```
## 
##                   Albania                   Algeria            American Samoa 
##                        67                        59                        32 
##                    Angola                  Anguilla       Antigua and Barbuda 
##                        88                         3                        22 
##                 Argentina                     Aruba                 Australia 
##                       140                         5                       301 
##                   Bahamas                   Bahrain                Bangladesh 
##                        14                        62                         8 
##                  Barbados                   Belgium                    Belize 
##                        21                        57                       133 
##                     Benin                   Bermuda  Bonaire/S.Eustatius/Saba 
##                        68                        47                         2 
##    Bosnia and Herzegovina                    Brazil  British Indian Ocean Ter 
##                         1                       136                         7 
##    British Virgin Islands         Brunei Darussalam                  Bulgaria 
##                        18                         8                       197 
##                Cabo Verde                  Cambodia                  Cameroon 
##                        26                         8                        36 
##                    Canada            Cayman Islands           Channel Islands 
##                       125                         4                        65 
##                     Chile                     China      China, Hong Kong SAR 
##                       141                       236                        32 
##          China, Macao SAR                  Colombia                   Comoros 
##                         4                        81                        43 
##   Congo, Dem. Rep. of the        Congo, Republic of              Cook Islands 
##                        21                        53                        55 
##                Costa Rica                   Croatia                      Cuba 
##                        45                       103                       162 
##                Cura\xe7ao                    Cyprus          C\xf4te d'Ivoire 
##                         9                        96                        67 
##                   Denmark                  Djibouti                  Dominica 
##                       103                        14                        13 
##        Dominican Republic                   Ecuador                     Egypt 
##                        50                       100                        87 
##               El Salvador         Equatorial Guinea                   Eritrea 
##                        25                        15                        49 
##                   Estonia                  Ethiopia    Falkland Is.(Malvinas) 
##                       184                         5                        33 
##             Faroe Islands         Fiji, Republic of                   Finland 
##                        96                        50                        16 
##                    France             French Guiana          French Polynesia 
##                       489                        18                        31 
##      French Southern Terr                     Gabon                    Gambia 
##                         3                        45                        49 
##                   Georgia                   Germany                     Ghana 
##                        86                       306                        94 
##                 Gibraltar                    Greece                 Greenland 
##                         1                       125                        60 
##                   Grenada                Guadeloupe                      Guam 
##                        47                         8                        23 
##                 Guatemala                    Guinea              GuineaBissau 
##                        38                        56                        32 
##                    Guyana                     Haiti                  Honduras 
##                        11                         6                        68 
##                   Iceland                     India                 Indonesia 
##                       107                       108                       223 
##    Iran (Islamic Rep. of)                      Iraq                   Ireland 
##                        64                        16                       191 
##               Isle of Man                    Israel                     Italy 
##                        41                        79                       261 
##                   Jamaica                     Japan                    Jordan 
##                         6                       611                        12 
##                     Kenya                  Kiribati  Korea, Dem. People's Rep 
##                        31                        27                        14 
##        Korea, Republic of                    Kuwait                    Latvia 
##                       620                        23                       162 
##                   Lebanon                   Liberia                     Libya 
##                        20                        76                        56 
##                 Lithuania                Madagascar                  Malaysia 
##                       215                        35                       166 
##                  Maldives                     Malta          Marshall Islands 
##                        12                       104                        13 
##                Martinique                Mauritania                 Mauritius 
##                        16                        93                        30 
##                   Mayotte                    Mexico Micronesia, Fed.States of 
##                        14                       198                        13 
##                    Monaco                Montenegro                Montserrat 
##                         1                        24                         1 
##                   Morocco                Mozambique                   Myanmar 
##                       153                        30                         5 
##                   Namibia                     Nauru               Netherlands 
##                        76                         9                       155 
##      Netherlands Antilles             New Caledonia               New Zealand 
##                        17                        26                       208 
##                 Nicaragua                   Nigeria                      Niue 
##                        59                        50                        11 
##            Norfolk Island      Northern Mariana Is.                    Norway 
##                         1                        19                       188 
##                      Oman                 Other nei                  Pakistan 
##                        53                       100                        60 
##                     Palau   Palestine, Occupied Tr.                    Panama 
##                        33                        25                       121 
##          Papua New Guinea                      Peru               Philippines 
##                        20                        54                       138 
##          Pitcairn Islands                    Poland                  Portugal 
##                         1                       263                       763 
##               Puerto Rico                     Qatar                   Romania 
##                        49                        35                       191 
##        Russian Federation                R\xe9union       Saint Barth\xe9lemy 
##                       523                        37                         1 
##              Saint Helena     Saint Kitts and Nevis               Saint Lucia 
##                        19                        28                        27 
##  Saint Vincent/Grenadines               SaintMartin                     Samoa 
##                        71                         1                        15 
##     Sao Tome and Principe              Saudi Arabia                   Senegal 
##                        35                       128                       140 
##     Serbia and Montenegro                Seychelles              Sierra Leone 
##                        45                        70                        59 
##                 Singapore              Sint Maarten                  Slovenia 
##                        40                         2                        50 
##           Solomon Islands                   Somalia              South Africa 
##                        18                         3                       200 
##                     Spain                 Sri Lanka   St. Pierre and Miquelon 
##                       915                        34                        40 
##                     Sudan            Sudan (former)                  Suriname 
##                         3                         3                        27 
##    Svalbard and Jan Mayen                    Sweden      Syrian Arab Republic 
##                         1                        72                        34 
##  Taiwan Province of China  Tanzania, United Rep. of                  Thailand 
##                       310                        49                       150 
##                TimorLeste                      Togo                   Tokelau 
##                         7                        78                        10 
##                     Tonga       Trinidad and Tobago                   Tunisia 
##                        14                        39                        85 
##                    Turkey      Turks and Caicos Is.                    Tuvalu 
##                        76                         6                        10 
##         US Virgin Islands                   Ukraine        Un. Sov. Soc. Rep. 
##                        29                       294                       515 
##      United Arab Emirates            United Kingdom  United States of America 
##                        52                       362                       627 
##                   Uruguay                   Vanuatu   Venezuela, Boliv Rep of 
##                       131                        71                        80 
##                  Viet Nam     Wallis and Futuna Is.            Western Sahara 
##                        14                         5                         3 
##                     Yemen            Yugoslavia SFR                  Zanzibar 
##                        39                        36                        19
```

```r
fisheries %>% 
  summarise(n_country2=n_distinct(country))
```

```
## # A tibble: 1 × 1
##   n_country2
##        <int>
## 1        204
```

4. Refocus the data only to include country, isscaap_taxonomic_group, asfis_species_name, asfis_species_number, year, catch.

```r
fisheries_tidy %>% 
  select(country, isscaap_taxonomic_group, asfis_species_name, asfis_species_number, year, catch)
```

```
## # A tibble: 376,771 × 6
##    country isscaap_taxonomic_group asfis_species_name asfis_specie…¹  year catch
##    <fct>   <chr>                   <chr>              <fct>          <dbl> <dbl>
##  1 Albania Sharks, rays, chimaeras Squatinidae        10903XXXXX      1995    NA
##  2 Albania Sharks, rays, chimaeras Squatinidae        10903XXXXX      1996    53
##  3 Albania Sharks, rays, chimaeras Squatinidae        10903XXXXX      1997    20
##  4 Albania Sharks, rays, chimaeras Squatinidae        10903XXXXX      1998    31
##  5 Albania Sharks, rays, chimaeras Squatinidae        10903XXXXX      1999    30
##  6 Albania Sharks, rays, chimaeras Squatinidae        10903XXXXX      2000    30
##  7 Albania Sharks, rays, chimaeras Squatinidae        10903XXXXX      2001    16
##  8 Albania Sharks, rays, chimaeras Squatinidae        10903XXXXX      2002    79
##  9 Albania Sharks, rays, chimaeras Squatinidae        10903XXXXX      2003     1
## 10 Albania Sharks, rays, chimaeras Squatinidae        10903XXXXX      2004     4
## # … with 376,761 more rows, and abbreviated variable name ¹​asfis_species_number
```

5. Based on the asfis_species_number, how many distinct fish species were caught as part of these data?

1546 distinct species 

```r
fisheries_tidy %>% 
  count(asfis_species_name)
```

```
## # A tibble: 1,546 × 2
##    asfis_species_name            n
##    <chr>                     <int>
##  1 Ablennes hians               28
##  2 Abramis brama               389
##  3 Abramis spp                  67
##  4 Acanthistius brasilianus     89
##  5 Acanthocybium solandri     1216
##  6 Acanthopagrus berda          22
##  7 Acanthopagrus bifasciatus    51
##  8 Acanthopagrus latus          64
##  9 Acanthopagrus schlegeli      24
## 10 Acanthuridae                296
## # … with 1,536 more rows
```

6. Which country had the largest overall catch in the year 2000?

China

```r
fisheries_tidy %>% 
  filter(year==2000) %>%
  group_by(country) %>% 
  summarize(catch_total=sum(catch, na.rm=T)) %>% 
  arrange(desc(catch_total))
```

```
## # A tibble: 193 × 2
##    country                  catch_total
##    <fct>                          <dbl>
##  1 China                          25899
##  2 Russian Federation             12181
##  3 United States of America       11762
##  4 Japan                           8510
##  5 Indonesia                       8341
##  6 Peru                            7443
##  7 Chile                           6906
##  8 India                           6351
##  9 Thailand                        6243
## 10 Korea, Republic of              6124
## # … with 183 more rows
```

7. Which country caught the most sardines (_Sardina pilchardus_) between the years 1990-2000?
Morroco

```r
fisheries_tidy %>% 
  filter(year > 1990 & year < 2000  & asfis_species_name == "Sardina pilchardus") %>% 
  group_by(country) %>% 
   summarize(catch_total=sum(catch, na.rm=T)) %>% 
  arrange(desc(catch_total))
```

```
## # A tibble: 37 × 2
##    country               catch_total
##    <fct>                       <dbl>
##  1 Morocco                      5737
##  2 Spain                        2770
##  3 Russian Federation           1436
##  4 France                        801
##  5 Ukraine                       679
##  6 Portugal                      561
##  7 Denmark                       472
##  8 Italy                         465
##  9 Greece                        449
## 10 Serbia and Montenegro         442
## # … with 27 more rows
```

8. Which five countries caught the most cephalopods between 2008-2012?

```r
fisheries_tidy %>%
  group_by(country) %>%
  filter(isscaap_taxonomic_group =="Squids, cuttlefishes, octopuses") %>%
  filter(between(year, 2008, 2012)) %>%
  summarise(cephalopods_catch=sum(catch, na.rm=T)) %>%
  arrange(desc(cephalopods_catch)) %>%
  head(n=5)
```

```
## # A tibble: 5 × 2
##   country            cephalopods_catch
##   <fct>                          <dbl>
## 1 China                           8349
## 2 Korea, Republic of              3480
## 3 Peru                            3422
## 4 Japan                           3248
## 5 Chile                           2775
```

9. Which species had the highest catch total between 2008-2012? (hint: Osteichthyes is not a species)
Theragra chalcogramma had the highest catch total.

```r
fisheries_tidy %>% 
  filter(year > 2008 & year < 2012) %>% 
  group_by(asfis_species_name) %>% 
   summarize(catch_total=sum(catch, na.rm=T)) %>% 
  arrange(desc(catch_total))
```

```
## # A tibble: 1,438 × 2
##    asfis_species_name    catch_total
##    <chr>                       <dbl>
##  1 Osteichthyes                65288
##  2 Theragra chalcogramma       20614
##  3 Trichiurus lepturus         19655
##  4 Katsuwonus pelamis          18307
##  5 Clupea harengus             14880
##  6 Engraulis ringens           12973
##  7 Thunnus albacares           12333
##  8 Scomber japonicus            9046
##  9 Gadus morhua                 8384
## 10 Thunnus alalunga             7221
## # … with 1,428 more rows
```

10. Use the data to do at least one analysis of your choice.

```r
fisheries_tidy %>% 
  filter(year == 1999) %>% 
  group_by(country) %>% 
  summarize(catch_total=sum(catch, na.rm = T)) %>% 
  arrange(desc(catch_total))
```

```
## # A tibble: 192 × 2
##    country                  catch_total
##    <fct>                          <dbl>
##  1 China                          19413
##  2 Chile                          15501
##  3 United States of America       15154
##  4 Japan                           8297
##  5 Indonesia                       8182
##  6 Russian Federation              7634
##  7 India                           6379
##  8 Korea, Republic of              6177
##  9 Spain                           6069
## 10 Portugal                        5475
## # … with 182 more rows
```


## Push your final code to GitHub!
Please be sure that you check the `keep md` file in the knit preferences.   
