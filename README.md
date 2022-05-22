# Exploratory Data Analysis on DoorDash's dataset  

## Overview

* Cleaned, aggregated, and analyzed a large unstructured 18,000+ dataset of deliveries for one month using Python and SQL to derive actionable insights 
* Saved 25% of missing data in one of the timestamp columns through imputations 
* Used cleaned quantitative data to develop an understanding of business KPIs (e.g. average order volume, number of returning customers)
* Visualized findings using Google Sheets and Python 

## Goal
Analyze DoorDash's dataset and generate some specific recommendations or improvements on their business.

## Code Used:
* **Python Version:** 3.9 
* **Packages**: pandas, numpy, jupyter notebooks
* **Relational database management system:** Postgresql 
* **GUI tool:** pgAdmin 4

### Dataset Details 

* Customer order time: <day><hour>:<min>:<sec>
* Order at restaurant time:  <day><hour>:<min>:<sec>
* Driver arrives at restaurant time:  <day><hour>:<min>:<sec>
* Order delivered time: <day><hour>:<min>:<sec>
* Delivery Region 
* Driver ID
* Customer ID
* ASAP? (TRUE/FALSE)
* Amount of discount
* Tip Amount 
* Refunded amount

# Approach

### Step 1: Familiarize yourself with the company's business model

### Step 2: Data Cleaning 
* Changed data types for all the delivery times columns. From character varying to timestamp format. 
* Date and Time coumns only had day and time for each User Id. So, I used Python to generate randon month and year for each row so that it would be easier for me to work in SQL. It didn't affect the analysis, because the month and year was not taken into account. 
  
### Dataset Uncertainties 
1. About  ~ 25% of data in the "Driver arrives at restaurant time" column is missing
  **Solution** for this dataset uncertainty: (1) Delete Data or (2) Fill Missing Data
  However, deleting 25% of data will lead to biased results, so I’ve chosen to do imputations instead and save 25% of the data.
  
**Imputations Approach**

The formula for my imputations is: “Order delivered time” - “The average dasher delivery time for each region”
Where "average dasher delivery time for each region" is calculated by using this formula: “Order delivered time” - “Driver arrives at restaurant time”
Then, GROUP BY the delivery region and calculate the average time interval

In a real-life scenario, my imputations would be more complicated. I would GROUP BY not only by the delivery region but also by the IS_ASAP, Driver_ID, Restaurant_ID, and Consumer_ID. If I would have the address of the consumer, then I would use this as well in the calculation. 
  
2. 40 Null values in the “Order at restaurant time” column
**Solution**: (1) Delete Data 
As it accounts for only 0.22% of the data, I decided to drop these rows to save some time. In a real-case scenario, I would replace the missing data with a similar process  I did for the missing values in the “Driver arrives at restaurant time” column. 

3. Datetime format in this dataset is  <day> <hour>:<minute>:<second> 
This puts certain limitations because I could not perform seasonality analysis, or analysis for each day of the week for a particular month to see the trends without needing to make assumptions that day 1 is Monday and Day 7 is Sunday.


### Step 3: EDA
First, I've decided to use geographical data to identify "in-demand" regions. Essentially, understand from what region most of DoorDash's customer spending is coming from. *You can find Postgresql code [here](https://github.com/malikabaymuradova/DoorDash/blob/main/SQL_queries/all_sql_queries.sql)*
<img width="828" alt="Screen Shot 2022-05-20 at 14 21 48" src="https://user-images.githubusercontent.com/104313288/169589592-f80852f8-8b9d-442a-a309-97ad37118ebe.png">

As we can see from the graph above, **63% of total order volume is coming from Palo Alto Region**. It would be strategically wise to allocate resources for targeted marketing campaigns and/or grow partnerships in Palo Alto as most of the demand is coming from there. However, it is recommended to investigate the reason for lower demand in other two regions, because it might be possible that a competotor is winning over other regions, and we DoorDash can strategize and build more partneships with local merchants.
___
Second, let's investigate **what restaurants are most popular in each region**. The goal is to (1) deepen relationships with restaurants that have the higest order volume or order amount, (2) strategize future partenrhsips based on what people like in specific regions. and (3) build better recommendations system for consumers to drive customer growth

<img width="730" alt="Screen Shot 2022-05-20 at 15 38 20" src="https://user-images.githubusercontent.com/104313288/169599745-a974992f-ca38-417d-9cb6-5feb34a67a5b.png">

Given the demand, resources should be primarialy allocated to the Top 5 restaurants in Palo Alto region to attract more consumers to these restaurants. 
Assuming that DoorDash collects consumer data, it can utilize the data above data and find restaurants similar to these Top 5 restaurants in the same region. DoorDash can  recommend these restaurants to (1) consumers who like to order from these top restaurants more than once (2) consumers whose tastes are similar to the consumers who order form these top restaurants. 

This way we can help three sides of the DoorDash business:
1) New restaurants get more customers
2) These top restaurants get more customers & Doordash gets to deepen relationships and show their value
3) Consumers get better recommendations 
___
Third, let's create a list of bottom 5% revenue generating restaurants. 
![Screen Shot 2022-05-20 at 16 47 20](https://user-images.githubusercontent.com/104313288/169608393-58a29c17-0ec4-4949-b3d7-e5ddc6a45c30.png)
While it's important for DoorDash to strenghten the relationships with best performing merchants, it is also important to identify low performing ones because (1) DoorDash should identify causes of such performance: is it internal problem or external? (i.e. a problem with DoorDash tech integration, poor marketing that leads to mimimum exposure, poor dasher efficiency, or the restaurant food quality is bad, cometitiors, etc.)
___
Fourth, since datetime columns in the dataset are in the <day> <hour>:<minute>:<second> format, I made an assumption that Day 1 of the month is Monday, Day 2 is Tuesday, and etc. This way I amanged to analyze how the demand shifts throughout the week. Here's what I found:

![Total Number Of Orders In a Week (1)](https://user-images.githubusercontent.com/104313288/169668685-872f246c-d731-4d9e-aa4f-1a087bbc4b39.png)
  
Expectedly, the demand is high between Friday - Sunday and low between Wednesday-Friday. Unexpectedly, the demand is alos high between Monday-Wednesday. But this kind of insights can highlight days where DoorDash have to especially (1) push for marketing, and (2) make sure they can meet the deman so that their delivery efficiency is not compromised.

Fifth, let's find at what time order volume in a day order volume is at its highest. This way DoorDash can identify rush hours and (1) make sure that it has enough dashers ready to meet the demand on daily basis. Also, (2) DoorDash can share rush hours data with its dashers so that they can plan their work hours accordingly and earn more on deliveries and tips. *You can find Postgresql code [here](https://github.com/malikabaymuradova/DoorDash/blob/main/SQL_queries/all_sql_queries.sql)*

![Number of Orders and Total Order Amount For Each Hour (2)](https://user-images.githubusercontent.com/104313288/169667901-74329f59-d039-498a-a509-3030a8534b1b.png)

While increase in the amount of orders placed after 4:00  PM is expected, late night orders are quite suprising. Also, there minimal to 0 demand between 5:00 AM - 2:00 PM.
___
Sixth, let's investigate the dasher side of the business. From the [graph](https://github.com/malikabaymuradova/DoorDash/blob/main/Python_and_Imputations_datasets/correlation_dasher_delivery_time_with_tips.ipynb) below, you can see that the less the delivery time is, the more likely consumers to add tips for their dashers. Consumers primarily leave tips if dasher delivery time is under 75 minutes. 

<img width="503" alt="Screen Shot 2022-05-21 at 16 36 37" src="https://user-images.githubusercontent.com/104313288/169668222-5c370bf1-6c90-4bb0-b283-05116eaecbf0.png">
___
Lastly, I decided to dive into specifics and analyze consumer behavior. I was thinking about what kind of insights will be helpful to improve recommendation system & make it more personalized.

![Consumer Order History  (3)](https://user-images.githubusercontent.com/104313288/169669091-37d05b75-3dd2-4fe1-944c-f04269870456.png)

*Explanation of the graph: This is a chart for one consumer (consumerID: 514). We can see how many orders this consumer placed (y-axis) with each restaurant (x-axis) in one month.*

My goal is to show how can DoorDash use this ans similar data to (1) increase customer retention and (2) deepen relationships with their users. With insights like this available for each consumer, comapanies like DoorDash can invest into more persoanlized in-app notifications to incentivize their users to place another order. Also, is data of similar sorts will be collected for each consumer, DoorDash can create cusotmer profiles that highlight their food pereferences, favorite cousines, and etc. This way we can create a more interactive user-experience and predict their behavior in a way that will yield to better restaurant recommendation system.
  
What I mean when I say user profile is that we can label eahc of our customer by giving them names i.e, adventurous or "noodles-lover" etc, so that (1) users get a more interesting in-app experince, and also (2) DoorDash gets a chance to better understand user behavior so that it can build more personalized recommendation system. 
___
As the next step, I was aiming to show how can we use the same "order history" data for each consumer but for restaurants' benefit. 

![Restaurant's Returning Customers   (1)](https://user-images.githubusercontent.com/104313288/169669317-754777b8-95f3-4941-8b20-f233d4028e84.png)

Since for in-demand delivery company like DoorDash its important to help create necessary exposure for their partnered merchants. It can use data like this & share it with them. This way restaurants will be able to see their most loyal consumers and from time to time gift them with something extra to show that they are aware of their "loyalty". 
  
### Summary of insights  

* Data shows that there is more demand in Palo Alto and consumers order from restaurants that are located in Palo Alto the most
* The highest demand for dashers is between 11:00PM-4:00AM and 4:00PM - 20:00 PM
* There are a lot of customers that order from the same restaurants and a lot that experiment with their choices
* Identified all the returning customers for each restaurant and the frequency of their orders at each restaurant
* Identified Top 5 restaurants for each region based based on the total order number
* Identified Lowest Revenue Generated restaurants for each region
* A lot of restaurants are processing the order for over 50 minutes

### Step 4: Recommendations 
  
### Conclusion 

