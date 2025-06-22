Pollution <- read.csv('pollution_data.csv')

Pollution_clean <- Pollution %>%
  mutate(
    Population.Staying.at.Home = as.numeric(gsub(",", "", Population.Staying.at.Home)),
    Population.Not.Staying.at.Home = as.numeric(gsub(",", "", Population.Not.Staying.at.Home))
  )

#This is quite the amount of data, so we are going to group the data a couple of different ways.


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

z_scores <- (x - mu) / sigma
#performing a Z-score test to see if there is a correlation between miles and the CO3 
#emissions in the air, the test came back as 3.4 which means that there is quite the difference
#in standard deviation between those two variables. 

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

#By looking at the graphs, we can see that the scatter plot shows that there are some 
#states that average quite a few miles  (CA, IL, AZ) but the rest are in a group between 13 and
#75 million miles. The bar graph corroborates that with people going out in those same states. 
#This would support the hypothesis that the more people go out the more air pollution there is.
#However, with the linear regression model it would appear that there is a weak linear relationship 
#between staying at home and the N02 levels in the air. 
