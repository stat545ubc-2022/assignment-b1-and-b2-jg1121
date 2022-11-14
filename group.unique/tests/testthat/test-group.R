test_that("Test that group.unique works as expected",
          {expect_true(is_tibble(group.unique(vancouver_trees,
                                              on_street,
                                              genus_name))) #Test that the final output is a tibble object
            expect_error(group.unique(vancouver_trees,
                                      fake_x,
                                      fake_y)) #There should be an error when variable name isn't in dataset
            expect_identical((group.unique(vancouver_trees,
                                           on_street,
                                           genus_name)),
                             (vancouver_trees %>%
                                group_by(on_street) %>%
                                summarize(unique_variable_count =
                                            n_distinct(genus_name)))) #Test that the function gives an identical output to doing the problem manually

          }
)
