
<!-- README.md is generated from README.Rmd. Please edit that file -->

# group.unique

<!-- badges: start -->
<!-- badges: end -->

The goal of group.unique is to count the unique (aka distinct) values of
a variable that exist in each group of another variable of a dataset. It
will produce a tibble with two columns. The first is the grouped values,
and the second is the number of unique values per group.

## Installation

You can install the development version of group.unique from
[GitHub](https://github.com/) with:

``` r
# install.packages("devtools")
devtools::install_github("stat545ubc-2022/assignment-b1-and-b2-jg1121")
```

## Example

This is a basic example which shows you how to solve a common problem:

``` r
library(datateachr) #loading in example datasets
library(group.unique) #loading in the package
group.unique(vancouver_trees, neighbourhood_name, common_name)
#> # A tibble: 22 × 2
#>    neighbourhood_name       unique_variable_count
#>    <chr>                                    <int>
#>  1 ARBUTUS-RIDGE                              260
#>  2 DOWNTOWN                                   168
#>  3 DUNBAR-SOUTHLANDS                          364
#>  4 FAIRVIEW                                   223
#>  5 GRANDVIEW-WOODLAND                         310
#>  6 HASTINGS-SUNRISE                           347
#>  7 KENSINGTON-CEDAR COTTAGE                   323
#>  8 KERRISDALE                                 284
#>  9 KILLARNEY                                  237
#> 10 KITSILANO                                  336
#> # … with 12 more rows
```
