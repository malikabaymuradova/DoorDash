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

![alt text](https://github.com/malikabaymuradova/DoorDash/tree/main/AdditionalAnalysis "Number of Orders and Total Order Amount For Each Hour (2)")

