# Exploratory Data Analysis on DoorDash's dataset  

## Overview

* Cleaned, aggregated, and analyzed a large unstructured 18,000+ dataset of deliveries for one month using Python and SQL to derive actionable insights 
* Saved 40% of missing data in one of the timestamp columns through imputations 
* Used cleaned quantitative data to develop an understanding of business KPIs (e.g. average order volume, number of returning customers)
* Visualized findings using Google Sheets and Python 

## Goal
Analyze DoorDash's dataset and generate some specific recommendations or improvements on their business.

## Code and Resources Used:
* **Python Version:** 3.9 
* **Packages**: pandas, numpy, jupyter notebooks
* **Relational database management system:** Postgresql 
* **GUI tool:** pgAdmin 4

### Dataset Details 

* Customer order time
* Order at restaurant time
* Driver arrives at restaurant time
* Order delivered time
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

### Step 3: EDA
First, I've decided to use geographical data to identify "in-demand" regions. Essentially, understand from what region most of DoorDash's customer spending is coming from. 
<img width="828" alt="Screen Shot 2022-05-20 at 14 21 48" src="https://user-images.githubusercontent.com/104313288/169589592-f80852f8-8b9d-442a-a309-97ad37118ebe.png">

As we can see from the graph above, 63% of total order volume is coming from Palo Alto Region. It would be strategically wise to allocate resources for targeted marketing campaigns and/or grow partnerships in Palo Alto as most of the demand is coming from there. However, it is recommended to investigate the reason for lower demand in other two regions, because it might be possible that a competotor is winning over other regions, and we DoorDash can strategize and build more partneships with local merchants.

Second, let's investigate what restaurants are most popular in each region. The goal is to (1) deepen relationships with restaurants that have the higest order volume or order amount, (2) strategize future partenrhsips based on what people like in specific regions. and (3) build better recommendations system for consumers to drive customer growth

<img width="730" alt="Screen Shot 2022-05-20 at 15 38 20" src="https://user-images.githubusercontent.com/104313288/169599745-a974992f-ca38-417d-9cb6-5feb34a67a5b.png">

Given the demand, resources should be primarialy allocated to the Top 5 restaurants in Palo Alto region to attract more consumers to these restaurants. 
Assuming that DoorDash collects consumer data, it can utilize the data above data and find restaurants similar to these Top 5 restaurants in the same region. DoorDash can  recommend these restaurants to (1) consumers who like to order from these top restaurants more than once (2) consumers whose tastes are similar to the consumers who order form these top restaurants. 

This way we can help three sides of the DoorDash business:
1) New restaurants get more customers
2) These top restaurants get more customers & Doordash gets to deepen relationships and show their value
3) Consumers get better recommendations 

Third, 

<img width="311" alt="Screen Shot 2022-05-20 at 15 52 36" src="https://user-images.githubusercontent.com/104313288/169601488-2d95c1a8-7c28-4519-abe5-273712487df5.png">


