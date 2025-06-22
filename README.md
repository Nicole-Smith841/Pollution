# Pollution
The data I am using was obtained through kaggle.com 
https://www.kaggle.com/datasets/mayukh18/deap-deciphering-environmental-air-pollution

What data am I using? Pollution and its peaks and valleys  are important to how healthy people are in high traffic and urban developments. High traffic areas generally have more people moving around in cars and buses than walking and add to the pollution in the air. Therefore, using pollution_data we can provide useful insights into the trends of pollution. Analyzing those trends can then be used to see if the bigger the city and population, the higher the pollution rate or if there is another variable to factor into how polluted the air is. The pollution_data specifically uses how much the area travels and then references how much pollution is in the air. 

Hypothesis: cities/states that  have more people going out will have higher air pollution.

Data Cleaning: Performing quick summaries of the data, we have removed null values and the  duplicate values, and using the summary() function we can take a look at some numbers and what they might be saying. We did have to convert some of the columns so they were uniform.

![R 1](https://github.com/user-attachments/assets/7fb17467-1b5c-4845-afdb-8503ae67e39a)

Data Manipulation: This is quite the amount of data, so we are going to group the data a couple of different ways.

![R 2](https://github.com/user-attachments/assets/dab5cf13-cc0c-469f-a8f0-56b5bbd61151)

![R 3](https://github.com/user-attachments/assets/efb237d2-20e0-4e3f-a8a8-a1d7888b9ccd)

Next we are going to graph the data and see if any trends emerge

![R 5](https://github.com/user-attachments/assets/6cbc25ec-ae10-4315-8b1f-b9d4e32d08e3)

![R 6](https://github.com/user-attachments/assets/e4664198-f140-4ce1-9ed7-516081239499)

![R 4](https://github.com/user-attachments/assets/c851d7fb-309a-41c1-a634-4ef46ba7eca1)

By looking at the graphs, we can see that the scatter plot shows that there are some states that average quite a few miles  (CA, IL, AZ) but the rest are in a group between 13 and 75 million miles. The bar graph corroborates that with people going out in those same states. This would support the hypothesis that the more people go out the more air pollution there is. However, with the linear regression model it would appear that there is a weak linear relationship between staying at home and the N02 levels in the air. 

Then, performing a Z-score test to see if there is a correlation between miles and the CO3 emissions in the air, the test came back as 3.4 which means that there is quite the difference in standard deviation between those two variables. 
