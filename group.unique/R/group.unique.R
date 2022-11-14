# Documenting my function group.unique()

#' Count the unique values of a variable per a grouped variable.
#'
#'This function counts the unique (aka distinct) values of a variable that exist in each group of another variable of a dataset. It will produce a tibble with two columns. The first is the grouped values, and the second is the number of unique values per group.
#'
#'
#' @param dataset The dataset containing the variables that you wish to count unique values of a group from
#' @param grouped_variable Name of the column containing the variable that you want to group.
#' @param unique_variable Name of the column containing the variable that you want to extract the number of unique/distinct values from for each group in the grouped_variable.
#'
#' @return A tibble with two columns. The first column is the grouped values with the column name of the grouped_variable. The second column is the number of unique values of the other variable (unique_variable) per each group, with the column name "count_of_unique".
#' @importFrom dplyr %>% n_distinct
#' @import gapminder
#' @export
#'
#' @examples
#'library(datateachr)
#'group.unique(vancouver_trees, neighbourhood_name, common_name)
#'library(gapminder)
#'group.unique(gapminder, year, country)

group.unique <- function(dataset, grouped_variable, unique_variable) {
  dataset %>% dplyr::group_by({{grouped_variable}}) %>%
    dplyr::summarize(unique_variable_count = n_distinct({{unique_variable}}))
}



