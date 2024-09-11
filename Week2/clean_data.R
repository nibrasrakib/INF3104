library(janitor)
#### Basic cleaning ####
raw_elections_data <-
  read_csv(
    file = "Week2/canadian_voting.csv",
    show_col_types = FALSE
  )

cleaned_elections_data <- raw_elections_data |>
  separate(
    col=`Elected Candidate/Candidat élu`,
    into = c("Other", "party"),
    sep="/"
  )|> select(-Other)

cleaned_elections_data <-
  clean_names(cleaned_elections_data) |>
  select(electoral_district_name_nom_de_circonscription, party)

cleaned_elections_data <-
  cleaned_elections_data |>
  mutate(
    elected_party =
      case_match(
        party,
        "Libéral" ~ "Liberal",
        "Conservateur" ~ "Conservative",
        "NPD-Nouveau Parti démocratique" ~ "NDP",
        "Parti Vert" ~ "Green Party",
        "Bloc Québécois" ~ "Bloc Québécois"
      )
  ) |> select(electoral_district_name_nom_de_circonscription, elected_party)
write.csv(x=cleaned_elections_data, file="Week2/cleaned_canadian_voting.csv")
