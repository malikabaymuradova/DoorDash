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

** Data Cleaning 
* Changed data types for all the delivery times columns. From character varying to timestamp format. Since we only got the day and time for each User Id, I used Python to generate randon month and year for each row so that it would be easier for me to work in SQL. It didn't affect the analysis, because the month and year was not taken into account. 
* 

## Approach:
## Step 1: Familiarize yourself with company’s business model 
## Step 2: Familiarize yourself with the dataset
Understand what kind of information it includes, what is the data type for each column, make a note of columns with NULL values & decide what you want to do with them (delete or use imputations to fill in the missing values)

DoorDash Dataset details:
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

## Step 3: Ask Questions
Use bottom-up approach: Start by looking at the dataset and trying to come up with things to investigate. First, try asking broad questions and see what can you learn from this dataset, and what potential valuable insights can you generate?
Keep in mind what will be of value for the DoorDash and its three sides of business. Why did they decide to collect this information? What do they care about and how this information can be helpful for them? 
For example:
You've figured out that for companies like DoorDash efficinecy is a priority, so maybe you would want to investigate. Strategivally 
**
## Step 4: Analysis 
Once you've formulated your questuons, you want to dive into data analysis and see what kind of insights you were able to pull off.
## Step 4: Ask Questions 
