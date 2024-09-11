#### Read in the data ####
raw_elections_data <-
  read_csv(
    file = 
      "https://www.elections.ca/res/rep/off/ovr2021app/53/data_donnees/table_tableau11.csv",
    show_col_types = FALSE,
  )

write_csv(
  x = raw_elections_data,
  file = "Week2/canadian_voting.csv"
)