library(tidyverse)
cleaned_elections_data <-
  read_csv(
    file = "Week2/cleaned_canadian_voting.csv",
    show_col_types = FALSE
  )

cleaned_elections_data |>
  ggplot(aes(x = elected_party)) + # aes abbreviates "aesthetics" 
  geom_bar()

cleaned_elections_data |>
  ggplot(aes(x = elected_party)) +
  geom_bar() +
  theme_minimal() + # Make the theme neater
  labs(x = "Riding", y = "Number of seats") # Make labels more meaningful