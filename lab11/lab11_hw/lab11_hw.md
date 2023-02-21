---
title: "Lab 11 Homework"
author: "Isaac Yang"
date: "2023-02-20"
output:
  html_document: 
    theme: spacelab
    keep_md: yes
---



## Instructions
Answer the following questions and complete the exercises in RMarkdown. Please embed all of your code and push your final work to your repository. Your final lab report should be organized, clean, and run free from errors. Remember, you must remove the `#` for the included code chunks to run. Be sure to add your name to the author header above. For any included plots, make sure they are clearly labeled. You are free to use any plot type that you feel best communicates the results of your analysis.  

**In this homework, you should make use of the aesthetics you have learned. It's OK to be flashy!**

Make sure to use the formatting conventions of RMarkdown to make your report neat and clean!  

## Load the libraries

```r
library(tidyverse)
library(janitor)
library(here)
library(naniar)
```

## Resources
The idea for this assignment came from [Rebecca Barter's](http://www.rebeccabarter.com/blog/2017-11-17-ggplot2_tutorial/) ggplot tutorial so if you get stuck this is a good place to have a look.  

## Gapminder
For this assignment, we are going to use the dataset [gapminder](https://cran.r-project.org/web/packages/gapminder/index.html). Gapminder includes information about economics, population, and life expectancy from countries all over the world. You will need to install it before use. This is the same data that we will use for midterm 2 so this is good practice.

```r
library("gapminder")
```

## Questions
The questions below are open-ended and have many possible solutions. Your approach should, where appropriate, include numerical summaries and visuals. Be creative; assume you are building an analysis that you would ultimately present to an audience of stakeholders. Feel free to try out different `geoms` if they more clearly present your results.  

**1. Use the function(s) of your choice to get an idea of the overall structure of the data frame, including its dimensions, column names, variable classes, etc. As part of this, determine how NA's are treated in the data.**

```r
#dimensions
dim(gapminder)
```

```
## [1] 1704    6
```

```r
#column names
names(gapminder)
```

```
## [1] "country"   "continent" "year"      "lifeExp"   "pop"       "gdpPercap"
```

```r
#NAs
miss_var_summary(gapminder)
```

```
## # A tibble: 6 × 3
##   variable  n_miss pct_miss
##   <chr>      <int>    <dbl>
## 1 country        0        0
## 2 continent      0        0
## 3 year           0        0
## 4 lifeExp        0        0
## 5 pop            0        0
## 6 gdpPercap      0        0
```

```r
#variable classes
glimpse(gapminder)
```

```
## Rows: 1,704
## Columns: 6
## $ country   <fct> "Afghanistan", "Afghanistan", "Afghanistan", "Afghanistan", …
## $ continent <fct> Asia, Asia, Asia, Asia, Asia, Asia, Asia, Asia, Asia, Asia, …
## $ year      <int> 1952, 1957, 1962, 1967, 1972, 1977, 1982, 1987, 1992, 1997, …
## $ lifeExp   <dbl> 28.801, 30.332, 31.997, 34.020, 36.088, 38.438, 39.854, 40.8…
## $ pop       <int> 8425333, 9240934, 10267083, 11537966, 13079460, 14880372, 12…
## $ gdpPercap <dbl> 779.4453, 820.8530, 853.1007, 836.1971, 739.9811, 786.1134, …
```

```r
#I don't really see any abnormalitites that would be classified as NAs.
gapminder <- clean_names(gapminder)
gapminder
```

```
## # A tibble: 1,704 × 6
##    country     continent  year life_exp      pop gdp_percap
##    <fct>       <fct>     <int>    <dbl>    <int>      <dbl>
##  1 Afghanistan Asia       1952     28.8  8425333       779.
##  2 Afghanistan Asia       1957     30.3  9240934       821.
##  3 Afghanistan Asia       1962     32.0 10267083       853.
##  4 Afghanistan Asia       1967     34.0 11537966       836.
##  5 Afghanistan Asia       1972     36.1 13079460       740.
##  6 Afghanistan Asia       1977     38.4 14880372       786.
##  7 Afghanistan Asia       1982     39.9 12881816       978.
##  8 Afghanistan Asia       1987     40.8 13867957       852.
##  9 Afghanistan Asia       1992     41.7 16317921       649.
## 10 Afghanistan Asia       1997     41.8 22227415       635.
## # … with 1,694 more rows
```


**2. Among the interesting variables in gapminder is life expectancy. How has global life expectancy changed between 1952 and 2007?**

```r
gapminder2 <- gapminder %>% mutate(year=as_factor(year))
gapminder2 %>%
  group_by(year) %>%
  summarise(global_life_expectancy = mean(life_exp)) %>% 
ggplot(aes(x=year, y= global_life_expectancy))+geom_point()+labs(
    title = "Global Life Expectancy Change",
    x= "Year",
    y="Life Expectancy %")+
  theme(plot.title = element_text(size = rel(1.25), hjust = 0.5))
```

![](lab11_hw_files/figure-html/unnamed-chunk-4-1.png)<!-- -->


**3. How do the distributions of life expectancy compare for the years 1952 and 2007?**

```r
gapminder2 %>% 
  filter(year == "1952" | year =="2007") %>% 
  ggplot(aes(x= year, y= life_exp, fill = continent))+geom_boxplot(position = "dodge")+labs(
    title = "Distribution of Life Expectancies 1952 and 2007",
    x= "Year",
    y="Life Expectancy %")+
  theme(plot.title = element_text(size = rel(1.25), hjust = 0.5))
```

![](lab11_hw_files/figure-html/unnamed-chunk-5-1.png)<!-- -->


**4. Your answer above doesn't tell the whole story since life expectancy varies by region. Make a summary that shows the min, mean, and max life expectancy by continent for all years represented in the data.**

```r
gapminder2 %>% 
  group_by(continent) %>% 
  summarise(average_life_expectancy = mean(life_exp))
```

```
## # A tibble: 5 × 2
##   continent average_life_expectancy
##   <fct>                       <dbl>
## 1 Africa                       48.9
## 2 Americas                     64.7
## 3 Asia                         60.1
## 4 Europe                       71.9
## 5 Oceania                      74.3
```

```r
gapminder2 %>% 
  group_by(continent) %>% 
  top_n(1, life_exp) %>% 
  select(continent, life_exp)
```

```
## # A tibble: 5 × 2
## # Groups:   continent [5]
##   continent life_exp
##   <fct>        <dbl>
## 1 Oceania       81.2
## 2 Americas      80.7
## 3 Europe        81.8
## 4 Asia          82.6
## 5 Africa        76.4
```

```r
gapminder2 %>% 
  group_by(continent) %>% 
  top_n(-1, life_exp) %>% 
  select(continent, life_exp)
```

```
## # A tibble: 5 × 2
## # Groups:   continent [5]
##   continent life_exp
##   <fct>        <dbl>
## 1 Asia          28.8
## 2 Oceania       69.1
## 3 Americas      37.6
## 4 Africa        23.6
## 5 Europe        43.6
```


**5. How has life expectancy changed between 1952-2007 for each continent?**

```r
gapminder2 %>% 
  ggplot(aes(x= year, y= life_exp, fill = continent))+geom_col(position = "dodge")+labs(
    title = "Life Expectancies by Continent",
    x= "Year",
    y="Life Expectancy %")+
  theme(plot.title = element_text(size = rel(1.25), hjust = 0.5))
```

![](lab11_hw_files/figure-html/unnamed-chunk-7-1.png)<!-- -->

**6. We are interested in the relationship between per capita GDP and life expectancy; i.e. does having more money help you live longer?**

```r
gapminder2 %>% 
  ggplot(aes(x=gdp_percap, y=life_exp))+
  geom_point()+
  scale_x_log10()+
  geom_smooth(method=lm, se=F) +
  labs(title = "Per Capita GDP vs Life Expectancy",
       x= "Per Capita GDP (log.10)",
       y= "Life Expectancy") +
  theme(plot.title = element_text(size = rel(1.25), hjust = 0.5))
```

```
## `geom_smooth()` using formula = 'y ~ x'
```

![](lab11_hw_files/figure-html/unnamed-chunk-8-1.png)<!-- -->


**7. Which countries have had the largest population growth since 1952?**

```r
gapminder2 %>% 
  select(country, year, pop) %>% 
  filter(year == "1952"|year == "2007") %>% 
  pivot_wider(names_from = year,
              values_from = pop) %>% 
  mutate(pop_change = `2007` - `1952`) %>% 
  arrange(desc(pop_change))
```

```
## # A tibble: 142 × 4
##    country          `1952`     `2007` pop_change
##    <fct>             <int>      <int>      <int>
##  1 China         556263527 1318683096  762419569
##  2 India         372000000 1110396331  738396331
##  3 United States 157553000  301139947  143586947
##  4 Indonesia      82052000  223547000  141495000
##  5 Brazil         56602560  190010647  133408087
##  6 Pakistan       41346560  169270617  127924057
##  7 Bangladesh     46886859  150448339  103561480
##  8 Nigeria        33119096  135031164  101912068
##  9 Mexico         30144317  108700891   78556574
## 10 Philippines    22438691   91077287   68638596
## # … with 132 more rows
```

**8. Use your results from the question above to plot population growth for the top five countries since 1952.**

```r
gapminder2 %>% 
  filter(country == "China"|country == "India"|country == "United States"|country == "Indonesia"|country == "Brazil") %>% 
  ggplot(aes(x= year, y= pop, fill = country))+
  geom_col(position = "dodge")+
  labs(title = "Population Growth",
    x= "Year",
    y="Population")+
  theme(plot.title = element_text(size = rel(1.25), hjust = 0.5))
```

![](lab11_hw_files/figure-html/unnamed-chunk-10-1.png)<!-- -->


**9. How does per-capita GDP growth compare between these same five countries?**

```r
gapminder2 %>% 
  filter(country == "China"|country == "India"|country == "United States"|country == "Indonesia"|country == "Brazil") %>% 
  ggplot(aes(x=year, y= gdp_percap, fill = country))+
  geom_col(position = "dodge")+ 
  labs(title = "Per-Capita GDP Growth",
    x= "Year",
    y="Per-Capita GDP")+
  theme(plot.title = element_text(size = rel(1.25), hjust = 0.5))+
  scale_y_log10()
```

![](lab11_hw_files/figure-html/unnamed-chunk-11-1.png)<!-- -->


**10. Make one plot of your choice that uses faceting!**

```r
gapminder2 %>% 
  filter(country == "United States"|country == "China") %>% 
  ggplot(aes(x= year, y = life_exp, fill = country))+geom_col(position = "dodge")+
  labs(title = "United States vs China Life Expectancy",
    x= "Year",
    y="Life Expectancy %")+
  theme(plot.title = element_text(size = rel(1.25), hjust = 0.5))
```

![](lab11_hw_files/figure-html/unnamed-chunk-12-1.png)<!-- -->

## Push your final code to GitHub!
Please be sure that you check the `keep md` file in the knit preferences. 
