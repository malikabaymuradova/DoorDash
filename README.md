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

Second, let's investigate what restaurants are most popular in each region. This way we can (1) deepen relationships with restaurants that have the higest order volume or order amount, and (2) strategize future partenrhsips based on what people like in specific regions. 
Region: Palo Alto
![Top 5 Restaurants](https://user-images.githubusercontent.com/104313288/169599167-9283c1f6-c137-4851-a37a-93e5be7a32e8.png)



