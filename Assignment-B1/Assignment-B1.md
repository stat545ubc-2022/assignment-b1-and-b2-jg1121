Assignment-B1
================
Jennifer Green
2022-11-02

In this assignment we will be making a function in R, documenting it,
and testing it.

## Setup

``` r
#Loading the needed packages 
library(tidyverse)
library(testthat)
library(roxygen2)
library(gapminder)
library(ggplot2)
library(datateachr)
library(palmerpenguins)
library(devtools)
```

## Exercise 1 & 2 - Make a function & Document the function

I used the code sequence featured below multiple times in my STAT545A
milestone to compute the number of observations for a variable. So, I
wanted to make a function out of it. The code does the following with
the input of a data table:

1)  Groups by a column variable
2)  Summarizes the groups by the number of distinct observations of
    another variable.

Here I will be creating and documenting the function to count the unique
values by group

``` r
# Documentation of function

#' Count the unique values of a variable per a grouped variable.
#'
#' This function counts the unique (aka distinct) values of a variable that exist in each group of another variable of a dataset. It will produce a tibble with two columns. The first is the grouped values, and the second is the number of unique values per group. 
#' 
#'
#' @param dataset The dataset containing the variables that you wish to count unique values of a group from 
#' @param grouped_variable Name of the column containing the variable that you want to group.
#' @param unique_variable Name of the column containing the variable that you want to extract the number of unique/distinct values from for each group in the grouped_variable.
#'
#' @return A tibble with two columns. The first column is the grouped values with the column name of the grouped_variable. The second column is the number of unique values of the other variable (unique_variable) per each group, with the column name "count_of_unique". 


# Creating my function
Group_unique <- function(dataset, grouped_variable, unique_variable) {
  dataset %>% group_by({{grouped_variable}}) %>% 
  summarize(unique_variable_count = n_distinct({{unique_variable}}))
}
```

\##Exercise 3- Examples! Here I will look at 3 different datasets and
summarize a grouped variable by a distinct value of another variable.
This can help us answer specific questions about the dataset.

### Example: How many different types of trees are there in each neighbourhood of Vancouver?

Here I will count the number of different tree species (common_name) in
each neighbourhood (“neighbourhood_name”) of Vancouver, BC, using the
*vancouver_trees* dataset

``` r
Group_unique(vancouver_trees, neighbourhood_name, common_name)
```

    ## # A tibble: 22 × 2
    ##    neighbourhood_name       unique_variable_count
    ##    <chr>                                    <int>
    ##  1 ARBUTUS-RIDGE                              260
    ##  2 DOWNTOWN                                   168
    ##  3 DUNBAR-SOUTHLANDS                          364
    ##  4 FAIRVIEW                                   223
    ##  5 GRANDVIEW-WOODLAND                         310
    ##  6 HASTINGS-SUNRISE                           347
    ##  7 KENSINGTON-CEDAR COTTAGE                   323
    ##  8 KERRISDALE                                 284
    ##  9 KILLARNEY                                  237
    ## 10 KITSILANO                                  336
    ## # … with 12 more rows

This gives us an idea of the biodiversity per neighborhood! We could
later sort the count_of_unique column to know which neighbourhoods have
the most biodiversity.

### Example: How many different penguin species are there on each island?

Here I will count the number of different penguin species (“species”) on
each island (“island”) sampled in the *penguins* dataset.

``` r
Group_unique(penguins, island, species)
```

    ## # A tibble: 3 × 2
    ##   island    unique_variable_count
    ##   <fct>                     <int>
    ## 1 Biscoe                        2
    ## 2 Dream                         2
    ## 3 Torgersen                     1

Here we can learn that 2 of the islands only had 2 out of the 3 species
studied. The other island only had one of the three species.

### Example: How many different countrys were sampled per year in gapminder?

Here I will count the number of different countries (“country”)
investigated per year (“year”) in the using the *gapminder* dataset.
This could help us know if the dataset was skewed or bias.

``` r
Group_unique(gapminder, year, country)
```

    ## # A tibble: 12 × 2
    ##     year unique_variable_count
    ##    <int>                 <int>
    ##  1  1952                   142
    ##  2  1957                   142
    ##  3  1962                   142
    ##  4  1967                   142
    ##  5  1972                   142
    ##  6  1977                   142
    ##  7  1982                   142
    ##  8  1987                   142
    ##  9  1992                   142
    ## 10  1997                   142
    ## 11  2002                   142
    ## 12  2007                   142

It looks like they surveyed the same number of countries (142) every
year. These were likely the same countries each year.

## Exercise 4: Test the Function

``` r
#Three expect statements to test my function

test_that("Test that Group_unique works as expected",
          {expect_true(is_tibble(Group_unique(vancouver_trees, 
                                      on_street,
                                      genus_name))) #Test that the final output is a tibble object
            expect_error(Group_unique(vancouver_trees,
                                      fake_x,
                                      fake_y)) #There should be an error when variable name isn't in dataset
            expect_identical((Group_unique(vancouver_trees, 
                                           on_street, 
                                           genus_name)), 
                              (vancouver_trees %>% 
                                 group_by(on_street) %>% 
                                 summarize(unique_variable_count = 
                                             n_distinct(genus_name)))) #Test that the function gives an identical output to doing the problem manually
            
}
          )
```

    ## Test passed 🎊
