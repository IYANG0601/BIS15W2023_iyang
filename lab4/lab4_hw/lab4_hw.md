---
title: "Lab 4 Homework"
author: "Isaac Yang"
date: "2023-01-23"
output:
  html_document: 
    theme: spacelab
    keep_md: yes
---



## Instructions
Answer the following questions and complete the exercises in RMarkdown. Please embed all of your code and push your final work to your repository. Your final lab report should be organized, clean, and run free from errors. Remember, you must remove the `#` for the included code chunks to run. Be sure to add your name to the author header above.  

Make sure to use the formatting conventions of RMarkdown to make your report neat and clean!  

## Load the tidyverse

```r
library(tidyverse)
```

## Data
For the homework, we will use data about vertebrate home range sizes. The data are in the class folder, but the reference is below.  

**Database of vertebrate home range sizes.**  
Reference: Tamburello N, Cote IM, Dulvy NK (2015) Energy and the scaling of animal space use. The American Naturalist 186(2):196-211. http://dx.doi.org/10.1086/682070.  
Data: http://datadryad.org/resource/doi:10.5061/dryad.q5j65/1  

**1. Load the data into a new object called `homerange`.**

```r
homerange <- readr::read_csv("data/Tamburelloetal_HomeRangeDatabase.csv")
```

```
## Rows: 569 Columns: 24
## ── Column specification ────────────────────────────────────────────────────────
## Delimiter: ","
## chr (16): taxon, common.name, class, order, family, genus, species, primarym...
## dbl  (8): mean.mass.g, log10.mass, mean.hra.m2, log10.hra, dimension, preyma...
## 
## ℹ Use `spec()` to retrieve the full column specification for this data.
## ℹ Specify the column types or set `show_col_types = FALSE` to quiet this message.
```


**2. Explore the data. Show the dimensions, column names, classes for each variable, and a statistical summary. Keep these as separate code chunks.**  

```r
dim(homerange)
```

```
## [1] 569  24
```

```r
colnames(homerange)
```

```
##  [1] "taxon"                      "common.name"               
##  [3] "class"                      "order"                     
##  [5] "family"                     "genus"                     
##  [7] "species"                    "primarymethod"             
##  [9] "N"                          "mean.mass.g"               
## [11] "log10.mass"                 "alternative.mass.reference"
## [13] "mean.hra.m2"                "log10.hra"                 
## [15] "hra.reference"              "realm"                     
## [17] "thermoregulation"           "locomotion"                
## [19] "trophic.guild"              "dimension"                 
## [21] "preymass"                   "log10.preymass"            
## [23] "PPMR"                       "prey.size.reference"
```

```r
homerange_colnames<- colnames(homerange)
```

```r
class(homerange_colnames)
```

```
## [1] "character"
```

```r
class("taxon")
```

```
## [1] "character"
```

```r
class("common.name")
```

```
## [1] "character"
```

```r
class("class")
```

```
## [1] "character"
```

```r
class("order")
```

```
## [1] "character"
```

```r
class("family")
```

```
## [1] "character"
```

```r
class("genus")
```

```
## [1] "character"
```

```r
class("species")
```

```
## [1] "character"
```

```r
class("primarymethod")
```

```
## [1] "character"
```

```r
class("N")
```

```
## [1] "character"
```

```r
class("mean.mass.g")
```

```
## [1] "character"
```

```r
class("log10.mass")
```

```
## [1] "character"
```

```r
class("alternative.mass.reference")
```

```
## [1] "character"
```

```r
class("mean.hra.m2")
```

```
## [1] "character"
```

```r
class("log10.hra")
```

```
## [1] "character"
```

```r
class("hra.reference")
```

```
## [1] "character"
```

```r
class("realm")
```

```
## [1] "character"
```

```r
class("thermoregulation")
```

```
## [1] "character"
```

```r
class("locomotion")
```

```
## [1] "character"
```

```r
class("trophic.guild")
```

```
## [1] "character"
```

```r
class("dimension")
```

```
## [1] "character"
```

```r
class("preymass")
```

```
## [1] "character"
```

```r
class("log10.preymass")
```

```
## [1] "character"
```

```r
class("PPMR")
```

```
## [1] "character"
```

```r
class("prey.size.reference")
```

```
## [1] "character"
```

```r
summary(homerange)
```

```
##     taxon           common.name           class              order          
##  Length:569         Length:569         Length:569         Length:569        
##  Class :character   Class :character   Class :character   Class :character  
##  Mode  :character   Mode  :character   Mode  :character   Mode  :character  
##                                                                             
##                                                                             
##                                                                             
##                                                                             
##     family             genus             species          primarymethod     
##  Length:569         Length:569         Length:569         Length:569        
##  Class :character   Class :character   Class :character   Class :character  
##  Mode  :character   Mode  :character   Mode  :character   Mode  :character  
##                                                                             
##                                                                             
##                                                                             
##                                                                             
##       N              mean.mass.g        log10.mass     
##  Length:569         Min.   :      0   Min.   :-0.6576  
##  Class :character   1st Qu.:     50   1st Qu.: 1.6990  
##  Mode  :character   Median :    330   Median : 2.5185  
##                     Mean   :  34602   Mean   : 2.5947  
##                     3rd Qu.:   2150   3rd Qu.: 3.3324  
##                     Max.   :4000000   Max.   : 6.6021  
##                                                        
##  alternative.mass.reference  mean.hra.m2          log10.hra     
##  Length:569                 Min.   :0.000e+00   Min.   :-1.523  
##  Class :character           1st Qu.:4.500e+03   1st Qu.: 3.653  
##  Mode  :character           Median :3.934e+04   Median : 4.595  
##                             Mean   :2.146e+07   Mean   : 4.709  
##                             3rd Qu.:1.038e+06   3rd Qu.: 6.016  
##                             Max.   :3.551e+09   Max.   : 9.550  
##                                                                 
##  hra.reference         realm           thermoregulation    locomotion       
##  Length:569         Length:569         Length:569         Length:569        
##  Class :character   Class :character   Class :character   Class :character  
##  Mode  :character   Mode  :character   Mode  :character   Mode  :character  
##                                                                             
##                                                                             
##                                                                             
##                                                                             
##  trophic.guild        dimension        preymass         log10.preymass   
##  Length:569         Min.   :2.000   Min.   :     0.67   Min.   :-0.1739  
##  Class :character   1st Qu.:2.000   1st Qu.:    20.02   1st Qu.: 1.3014  
##  Mode  :character   Median :2.000   Median :    53.75   Median : 1.7304  
##                     Mean   :2.218   Mean   :  3989.88   Mean   : 2.0188  
##                     3rd Qu.:2.000   3rd Qu.:   363.35   3rd Qu.: 2.5603  
##                     Max.   :3.000   Max.   :130233.20   Max.   : 5.1147  
##                                     NA's   :502         NA's   :502      
##       PPMR         prey.size.reference
##  Min.   :  0.380   Length:569         
##  1st Qu.:  3.315   Class :character   
##  Median :  7.190   Mode  :character   
##  Mean   : 31.752                      
##  3rd Qu.: 15.966                      
##  Max.   :530.000                      
##  NA's   :502
```


**3. Change the class of the variables `taxon` and `order` to factors and display their levels.**  

```r
homerange$taxon <- as.factor(homerange$taxon)
levels(homerange$taxon)
```

```
## [1] "birds"         "lake fishes"   "lizards"       "mammals"      
## [5] "marine fishes" "river fishes"  "snakes"        "tortoises"    
## [9] "turtles"
```

```r
homerange$order <- as.factor(homerange$order)
levels(homerange$order)
```

```
##  [1] "accipitriformes"       "afrosoricida"          "anguilliformes"       
##  [4] "anseriformes"          "apterygiformes"        "artiodactyla"         
##  [7] "caprimulgiformes"      "carnivora"             "charadriiformes"      
## [10] "columbidormes"         "columbiformes"         "coraciiformes"        
## [13] "cuculiformes"          "cypriniformes"         "dasyuromorpha"        
## [16] "dasyuromorpia"         "didelphimorphia"       "diprodontia"          
## [19] "diprotodontia"         "erinaceomorpha"        "esociformes"          
## [22] "falconiformes"         "gadiformes"            "galliformes"          
## [25] "gruiformes"            "lagomorpha"            "macroscelidea"        
## [28] "monotrematae"          "passeriformes"         "pelecaniformes"       
## [31] "peramelemorphia"       "perciformes"           "perissodactyla"       
## [34] "piciformes"            "pilosa"                "proboscidea"          
## [37] "psittaciformes"        "rheiformes"            "roden"                
## [40] "rodentia"              "salmoniformes"         "scorpaeniformes"      
## [43] "siluriformes"          "soricomorpha"          "squamata"             
## [46] "strigiformes"          "struthioniformes"      "syngnathiformes"      
## [49] "testudines"            "tinamiformes"          "tetraodontiformes\xa0"
```


**4. What taxa are represented in the `homerange` data frame? Make a new data frame `taxa` that is restricted to taxon, common name, class, order, family, genus, species.**  
The taxa represented are birds, lake fishes, lizards, mammals, marine fishes, river fishes, snakes, tortoises, and turtles.

```r
taxa <- select(homerange, taxon, "common.name", "class", order, "family", "genus", "species") 
taxa
```

```
## # A tibble: 569 × 7
##    taxon         common.name             class        order family genus species
##    <fct>         <chr>                   <chr>        <fct> <chr>  <chr> <chr>  
##  1 lake fishes   american eel            actinoptery… angu… angui… angu… rostra…
##  2 river fishes  blacktail redhorse      actinoptery… cypr… catos… moxo… poecil…
##  3 river fishes  central stoneroller     actinoptery… cypr… cypri… camp… anomal…
##  4 river fishes  rosyside dace           actinoptery… cypr… cypri… clin… fundul…
##  5 river fishes  longnose dace           actinoptery… cypr… cypri… rhin… catara…
##  6 river fishes  muskellunge             actinoptery… esoc… esoci… esox  masqui…
##  7 marine fishes pollack                 actinoptery… gadi… gadid… poll… pollac…
##  8 marine fishes saithe                  actinoptery… gadi… gadid… poll… virens 
##  9 marine fishes lined surgeonfish       actinoptery… perc… acant… acan… lineat…
## 10 marine fishes orangespine unicornfish actinoptery… perc… acant… naso  litura…
## # … with 559 more rows
```

```r
arrange(taxa, taxon)
```

```
## # A tibble: 569 × 7
##    taxon common.name            class order            family      genus species
##    <fct> <chr>                  <chr> <fct>            <chr>       <chr> <chr>  
##  1 birds golden eagle           aves  accipitriformes  accipitrid… aqui… chrysa…
##  2 birds common buzzard         aves  accipitriformes  accipitrid… buteo buteo  
##  3 birds short-toed snake eagle aves  accipitriformes  accipitrid… circ… gallic…
##  4 birds Bonelli's eagle        aves  accipitriformes  accipitrid… hier… fascia…
##  5 birds booted eagle           aves  accipitriformes  accipitrid… hier… pennat…
##  6 birds Egyptian vulture       aves  accipitriformes  accipitrid… neop… percno…
##  7 birds gadwall                aves  anseriformes     anatidae    anas  strepe…
##  8 birds northern brown kiwi    aves  apterygiformes   apterygidae apte… austra…
##  9 birds European nightjar      aves  caprimulgiformes caprimulgi… capr… europa…
## 10 birds oystercatcher          aves  charadriiformes  haematopod… haem… ostral…
## # … with 559 more rows
```


**5. The variable `taxon` identifies the large, common name groups of the species represented in `homerange`. Make a table the shows the counts for each of these `taxon`.**  

```r
table(taxa$taxon)
```

```
## 
##         birds   lake fishes       lizards       mammals marine fishes 
##           140             9            11           238            90 
##  river fishes        snakes     tortoises       turtles 
##            14            41            12            14
```


**6. The species in `homerange` are also classified into trophic guilds. How many species are represented in each trophic guild.**  

```r
table(homerange$trophic.guild)
```

```
## 
## carnivore herbivore 
##       342       227
```


**7. Make two new data frames, one which is restricted to carnivores and another that is restricted to herbivores.**  

```r
carnivore_data <- filter(homerange, trophic.guild == "carnivore")
carnivore_data
```

```
## # A tibble: 342 × 24
##    taxon  commo…¹ class order family genus species prima…² N     mean.…³ log10…⁴
##    <fct>  <chr>   <chr> <fct> <chr>  <chr> <chr>   <chr>   <chr>   <dbl>   <dbl>
##  1 lake … americ… acti… angu… angui… angu… rostra… teleme… 16       887    2.95 
##  2 river… blackt… acti… cypr… catos… moxo… poecil… mark-r… <NA>     562    2.75 
##  3 river… centra… acti… cypr… cypri… camp… anomal… mark-r… 20        34    1.53 
##  4 river… rosysi… acti… cypr… cypri… clin… fundul… mark-r… 26         4    0.602
##  5 river… longno… acti… cypr… cypri… rhin… catara… mark-r… 17         4    0.602
##  6 river… muskel… acti… esoc… esoci… esox  masqui… teleme… 5       3525    3.55 
##  7 marin… pollack acti… gadi… gadid… poll… pollac… teleme… 2        737.   2.87 
##  8 marin… saithe  acti… gadi… gadid… poll… virens  teleme… 2        449.   2.65 
##  9 marin… giant … acti… perc… caran… cara… ignobi… teleme… 4        726.   2.86 
## 10 lake … rock b… acti… perc… centr… ambl… rupest… mark-r… 16       196    2.29 
## # … with 332 more rows, 13 more variables: alternative.mass.reference <chr>,
## #   mean.hra.m2 <dbl>, log10.hra <dbl>, hra.reference <chr>, realm <chr>,
## #   thermoregulation <chr>, locomotion <chr>, trophic.guild <chr>,
## #   dimension <dbl>, preymass <dbl>, log10.preymass <dbl>, PPMR <dbl>,
## #   prey.size.reference <chr>, and abbreviated variable names ¹​common.name,
## #   ²​primarymethod, ³​mean.mass.g, ⁴​log10.mass
```

```r
herbivore_data <- filter(homerange, trophic.guild == "herbivore")
herbivore_data
```

```
## # A tibble: 227 × 24
##    taxon  commo…¹ class order family genus species prima…² N     mean.…³ log10…⁴
##    <fct>  <chr>   <chr> <fct> <chr>  <chr> <chr>   <chr>   <chr>   <dbl>   <dbl>
##  1 marin… lined … acti… perc… acant… acan… lineat… direct… <NA>   109.     2.04 
##  2 marin… orange… acti… perc… acant… naso  litura… teleme… 8      772.     2.89 
##  3 marin… bluesp… acti… perc… acant… naso  unicor… teleme… 7      152.     2.18 
##  4 marin… redlip… acti… perc… blenn… ophi… atlant… direct… 20       6.2    0.792
##  5 marin… bermud… acti… perc… kypho… kyph… sectat… teleme… 11    1087.     3.04 
##  6 marin… cherub… acti… perc… pomac… cent… argi    direct… <NA>     2.5    0.398
##  7 marin… damsel… acti… perc… pomac… chro… chromis direct… <NA>    28.4    1.45 
##  8 marin… twinsp… acti… perc… pomac… chry… biocel… direct… 18       9.19   0.963
##  9 marin… wards … acti… perc… pomac… poma… wardi   direct… <NA>    10.5    1.02 
## 10 marin… austra… acti… perc… pomac… steg… apical… direct… <NA>    45.3    1.66 
## # … with 217 more rows, 13 more variables: alternative.mass.reference <chr>,
## #   mean.hra.m2 <dbl>, log10.hra <dbl>, hra.reference <chr>, realm <chr>,
## #   thermoregulation <chr>, locomotion <chr>, trophic.guild <chr>,
## #   dimension <dbl>, preymass <dbl>, log10.preymass <dbl>, PPMR <dbl>,
## #   prey.size.reference <chr>, and abbreviated variable names ¹​common.name,
## #   ²​primarymethod, ³​mean.mass.g, ⁴​log10.mass
```

**8. Do herbivores or carnivores have, on average, a larger `mean.hra.m2`? Remove any NAs from the data.** 
On average, herbivores have a larger mean.hra.m2.

```r
mean(carnivore_data$mean.hra.m2, na.rm = T)
```

```
## [1] 13039918
```

```r
mean(herbivore_data$mean.hra.m2, na.rm = T)
```

```
## [1] 34137012
```

**9. Make a new dataframe `deer` that is limited to the mean mass, log10 mass, family, genus, and species of deer in the database. The family for deer is cervidae. Arrange the data in descending order by log10 mass. Which is the largest deer? What is its common name?**  
The largest deer is of the genus alces. The common name for it is a moose.

```r
deer <- select(homerange,  "log10.mass", "family", "genus", "mean.mass.g")
deer2 <- filter(deer, family == "cervidae")
deer2
```

```
## # A tibble: 12 × 4
##    log10.mass family   genus      mean.mass.g
##         <dbl> <chr>    <chr>            <dbl>
##  1       5.49 cervidae alces          307227.
##  2       4.80 cervidae axis            62823.
##  3       4.38 cervidae capreolus       24050.
##  4       5.37 cervidae cervus         234758.
##  5       4.47 cervidae cervus          29450.
##  6       4.85 cervidae dama            71450.
##  7       4.13 cervidae muntiacus       13500.
##  8       4.73 cervidae odocoileus      53864.
##  9       4.94 cervidae odocoileus      87884.
## 10       4.54 cervidae ozotoceros      35000.
## 11       3.88 cervidae pudu             7500.
## 12       5.01 cervidae rangifer       102059.
```

```r
arrange(deer2, log10.mass)
```

```
## # A tibble: 12 × 4
##    log10.mass family   genus      mean.mass.g
##         <dbl> <chr>    <chr>            <dbl>
##  1       3.88 cervidae pudu             7500.
##  2       4.13 cervidae muntiacus       13500.
##  3       4.38 cervidae capreolus       24050.
##  4       4.47 cervidae cervus          29450.
##  5       4.54 cervidae ozotoceros      35000.
##  6       4.73 cervidae odocoileus      53864.
##  7       4.80 cervidae axis            62823.
##  8       4.85 cervidae dama            71450.
##  9       4.94 cervidae odocoileus      87884.
## 10       5.01 cervidae rangifer       102059.
## 11       5.37 cervidae cervus         234758.
## 12       5.49 cervidae alces          307227.
```


**10. As measured by the data, which snake species has the smallest homerange? Show all of your work, please. Look this species up online and tell me about it!** **Snake is found in taxon column** 
The snake with the smallest homerange is the namaqua dwarf adder.
This snake is an endangered species and its venom causes pain and swelling. It hides in the sand to ambush its prey.

```r
snake <- filter(homerange, taxon == "snakes")
arrange(snake, mean.hra.m2)
```

```
## # A tibble: 41 × 24
##    taxon  commo…¹ class order family genus species prima…² N     mean.…³ log10…⁴
##    <fct>  <chr>   <chr> <fct> <chr>  <chr> <chr>   <chr>   <chr>   <dbl>   <dbl>
##  1 snakes namaqu… rept… squa… viper… bitis schnei… teleme… 11      17.0    1.23 
##  2 snakes easter… rept… squa… colub… carp… viridis radiot… 10       3.65   0.562
##  3 snakes butler… rept… squa… colub… tham… butleri mark-r… 1       21.5    1.33 
##  4 snakes wester… rept… squa… colub… carp… vermis  radiot… 1        3.46   0.539
##  5 snakes snubno… rept… squa… viper… vipe… latast… teleme… 7       97.4    1.99 
##  6 snakes chines… rept… squa… viper… gloy… shedao… teleme… 16     197.     2.29 
##  7 snakes ringne… rept… squa… colub… diad… puncta… mark-r… <NA>     9      0.954
##  8 snakes cotton… rept… squa… viper… agki… pisciv… teleme… 15     188      2.27 
##  9 snakes redbac… rept… squa… colub… ooca… rufodo… teleme… 21      62.5    1.80 
## 10 snakes gopher… rept… squa… colub… pitu… cateni… teleme… 4      375      2.57 
## # … with 31 more rows, 13 more variables: alternative.mass.reference <chr>,
## #   mean.hra.m2 <dbl>, log10.hra <dbl>, hra.reference <chr>, realm <chr>,
## #   thermoregulation <chr>, locomotion <chr>, trophic.guild <chr>,
## #   dimension <dbl>, preymass <dbl>, log10.preymass <dbl>, PPMR <dbl>,
## #   prey.size.reference <chr>, and abbreviated variable names ¹​common.name,
## #   ²​primarymethod, ³​mean.mass.g, ⁴​log10.mass
```


## Push your final code to GitHub!
Please be sure that you check the `keep md` file in the knit preferences.   
