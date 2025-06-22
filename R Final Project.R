Pollution <- read.csv('pollution_data.csv')

Pollution_clean <- Pollution %>%
  mutate(
    Population.Staying.at.Home = as.numeric(gsub(",", "", Population.Staying.at.Home)),
    Population.Not.Staying.at.Home = as.numeric(gsub(",", "", Population.Not.Staying.at.Home))
  )

state_summary <- Pollution_clean %>%
  group_by(State) %>%
  summarize(
    total_staying_home = sum(Population.Staying.at.Home, na.rm = TRUE),
    total_not_staying_home = sum(Population.Not.Staying.at.Home, na.rm = TRUE),
    avg_miles = mean(mil_miles, na.rm = TRUE))

city_summary <- Pollution_clean %>%
  group_by(City) %>%
  summarize(
    total_not_home = sum(Population.Not.Staying.at.Home, na.rm = TRUE),
    total_staying_home = sum(Population.Staying.at.Home, na.rm = TRUE),
    avg_miles = mean(mil_miles, na.rm = TRUE)
  )

sd(Pollution_clean$mil_miles)

Z <- (46.857 - 22.18) / (52.9639 / sqrt(55))

ggplot(Pollution_clean, aes(x = Population.Not.Staying.at.Home, y = no2_median)) +
  geom_point() +
  geom_smooth(method = "lm", se = FALSE, color = "blue") +
  labs(title = "Pop and NO2")

ggplot(state_summary, aes(x = State, y = avg_miles)) +
  geom_point(color = "darkgreen", size = 3) +
  labs(title = "States and Miles",
       x = "States",
       y = "Avg. Miles")

ggplot(state_summary, aes(x = State, y = total_not_staying_home)) +
  geom_bar(stat = "identity", fill = "steelblue") +
  labs(title = "People going out in Each State", x = "States", y = "Going Out") +
  theme_minimal()
