
# Analysis of Food Delivery Database


## Project Objective:
The objective of this project was to perform a comprehensive analysis of the food delivery database to extract meaningful insights, which can aid in improving customer satisfaction, optimizing restaurant operations, and enhancing delivery efficiency.

## Key Analyses & Insights:
  Customer Spending Analysis: 
  ```bash
SELECT cx.customer_name, SUM(od.total_amount) as Total_Spend  
FROM FOOD_DELIVERY.`Customers` cx 
RIGHT JOIN FOOD_DELIVERY.`Orders` od ON cx.customer_id=od.customer_id 
WHERE od.status='Delivered'
GROUP BY cx.customer_name;
```
**Insight**: This query calculates the total amount spent by each customer on successfully delivered orders, helping identify high-value customers who contribute significantly to revenue.

**Top 5 Restaurants by Order Volume:**
```bash
SELECT rs.restaurant_name, COUNT(od.order_id) as ORDER_COUNT 
FROM `Restaurants` rs 
LEFT JOIN `Orders` od ON rs.restaurant_id=od.restaurant_id
GROUP BY rs.restaurant_name
ORDER BY ORDER_COUNT DESC
LIMIT 5;
```
Insight: This query identifies the top 5 restaurants with the highest number of orders, providing insight into the most popular dining options.

**Order Delivery Delays:**
```bash
SELECT *, TIMESTAMPDIFF(MINUTE,estimated_delivery_time,actual_delivery_time) as Total_Delay 
FROM `Orders` 
WHERE actual_delivery_time > estimated_delivery_time AND status='Delivered'
ORDER BY Total_Delay DESC;
```
Insight: Lists orders that were delivered later than the estimated time, enabling the identification of areas where delivery processes can be improved.

**Average Order Value per Restaurant:**
```bash
SELECT rs.restaurant_name, ROUND(AVG(od.total_amount), 2) as AVG_AMOUNT 
FROM `Restaurants` rs 
LEFT JOIN `Orders` od ON rs.restaurant_id=od.restaurant_id
GROUP BY rs.restaurant_name
ORDER BY AVG_AMOUNT DESC;
```
Insight: Provides the average order value for each restaurant, helping to assess restaurant performance and pricing strategies.

**Idle Delivery Partners:**
```bash
SELECT dp.partner_name, COUNT(dl.order_id) AS CNT_OD 
FROM `Delivery_Partners` dp 
LEFT JOIN `Deliveries` dl ON dp.partner_id=dl.partner_id
GROUP BY dp.partner_name
HAVING CNT_OD = NULL;
```
Insight: Identifies delivery partners who have not completed any deliveries, which can be useful for workforce optimization.

**Total Quantity of Each Item Sold:**
```bash
SELECT `OD`.item_name, SUM(`OD`.quantity) AS Total_Qty  
FROM `Order_Items` OD
GROUP BY `OD`.item_name
ORDER BY Total_Qty DESC;
```
Insight: Lists the total quantity sold of each item, revealing the most popular menu items across all restaurants.

**Frequent Customers:**
```bash
SELECT cx.customer_name, COUNT(od.order_id) AS Count_Orders 
FROM `Customers` cx 
LEFT JOIN `Orders` od ON cx.customer_id=od.customer_id
GROUP BY cx.customer_name
HAVING Count_Orders >= 3;
```
Insight: Identifies customers who have placed more than three orders, aiding in loyalty program targeting.

**Highest Value Order:**
```bash
SELECT * 
FROM `Orders`
ORDER BY total_amount DESC
LIMIT 1;
```
Insight: Retrieves the order with the highest total amount, useful for understanding significant transactions.

**Recent Restaurant Deliveries:**
```bash
SELECT * 
FROM `Orders` 
WHERE actual_delivery_time > SYSDATE() - INTERVAL 7 DAY;
```
Insight: Lists restaurants that have delivered food in the last 7 days, helpful for monitoring recent activity.

**On-time Delivery Percentage by Partner:**
```bash
SELECT partner_id, Total_del_partner, Total_del, Total_del_partner/Total_del*100 AS Percentage 
FROM (
  SELECT *, COUNT(`Deliveries`.order_id) OVER() as Total_del, COUNT(`Deliveries`.order_id) OVER(PARTITION BY partner_id) as Total_del_partner 
  FROM `Deliveries`
) AS M;
```
Insight: Calculates the percentage of on-time deliveries for each delivery partner, providing a performance metric.

**Comprehensive Customer Order History:**
```bash
SELECT OD.customer_id, COUNT(DISTINCT OI.item_id) AS ORDER_IT 
FROM `Orders` OD 
RIGHT JOIN `Order_Items` OI ON OD.order_id=OI.order_id
GROUP BY OD.customer_id
HAVING ORDER_IT = (SELECT COUNT(DISTINCT OL.item_name ) FROM `Order_Items` OL);
```
Insight: Lists customers who have ordered every item available, indicating highly engaged customers.

**Dashboard**
<a href="https://ibb.co/kQtxFxq"><img src="https://i.ibb.co/HnjVQVG/Screenshot-2024-08-26-at-7-03-46-PM.png" alt="Screenshot-2024-08-26-at-7-03-46-PM" border="0"></a>


**Conclusion:** 
The analysis of the food delivery database using these queries provides a detailed understanding of customer behavior, restaurant performance, delivery efficiency, and item popularity. These insights can be leveraged to optimize operations, enhance customer satisfaction, and drive business growth. 
