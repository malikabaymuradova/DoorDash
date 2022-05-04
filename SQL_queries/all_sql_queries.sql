--------- avg earnings for rush hour for san jose 
SELECT EXTRACT (HOUR
                FROM cast("Customer_placed_order_datetime" as timestamp)) AS HOUR,
               Avg("Order_total") AS avg_earnings
FROM "DoorDash".doordash2
WHERE EXTRACT (HOUR
                FROM cast("Customer_placed_order_datetime" as timestamp)) BETWEEN 15 AND 17
  AND "Delivery_region" = 'San Jose' 
  GROUP  BY 1
-------------- A list of bottom 5% revenue generating restaurants 
with t1 as
(
select "Restaurant_ID" , 
sum("Order_total") order_total_store
from "DoorDash".doordash2 
group by 1
)
, t2 as
(
select t1.*
, rank()over(order by order_total_store desc) store_rank
, rank()over(order by order_total_store asc)*1.0/100 store_rank_percent
from t1
)

select "Restaurant_ID", order_total_store 
from t2
where store_rank_percent <= 0.05
order by store_rank_percent
-- -- -- -- -- -- -- -- -- total order amount (earnings) for each hour
SELECT EXTRACT (HOUR
                FROM cast("Customer_placed_order_datetime" as timestamp)) AS HOUR,
                sum("Order_total") AS number_of_orders
FROM "DoorDash".doordash2  
GROUP BY HOUR
ORDER BY HOUR
                                 
-- -- -- -- -- -- -- total orders for each hour for each week over one monthspan 

SELECT EXTRACT(isodow from ("Customer_placed_order_datetime"::date)) as day_of_the_week,
	   EXTRACT (HOUR from cast("Customer_placed_order_datetime" as timestamp)) AS HOUR,
                sum("Order_total") AS number_of_orders
FROM "DoorDash".doordash2  
GROUP BY 1,2 
ORDER BY 1,2

-- -- -- -- -- -- -- -- average delivery time for each region
SELECT "Delivery_region", (cast("Delivered_to_consumer_datetime" as timestamp)::time - cast("Driver_at_restaraunt_datetime" as timestamp)::time) as TimeDiff
FROM "DoorDash".doordash2
WHERE "Delivery_region" <>  'None'
GROUP BY 1,2
-- -- -- -- ------------ find returning consumers and identify their favorite restaurants 
with t1 as (SELECT "Consumer_ID", "Restaurant_ID", dense_rank() over(partition by "Consumer_ID" order by COUNT("Restaurant_ID")) as order_count
FROM "DoorDash".doordash2
GROUP BY 1,2
)
SELECT "Consumer_ID", "Restaurant_ID", order_count
FROM t1
WHERE order_count = 1
ORDER BY order_count 
-- -- -- -- -- -- -- --  find a consumer count for restaurant with ID 9 
with t1 as (SELECT "Restaurant_ID","Consumer_ID",
dense_rank() over(partition by "Restaurant_ID" order by COUNT("Consumer_ID")) as consumer_count
FROM "DoorDash".doordash2
GROUP BY 1,2
		 )
SELECT "Restaurant_ID","Consumer_ID", consumer_count
FROM t1
WHERE "Restaurant_ID" = '9' and consumer_count > 1

--for each restaurat find total orders made for each reagion

select "Restaurant_ID", "Delivery_region", count("Delivery_region") over(partition by "Restaurant_ID")
from "DoorDash".doordash
where "Delivery_region" <> 'None'
group by 1,2
		   