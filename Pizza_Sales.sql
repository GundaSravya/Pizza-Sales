/* Total Revenue:*/
select round(sum(total_price),2) as 'Total Revenue' from pizza_sales;

/* Average Order Value*/
SELECT SUM(total_price) / COUNT(DISTINCT order_id) AS Avg_order_Value FROM pizza_sales;

/* Total Pizzas Sold*/
select SUM(quantity) AS 'Total_pizza_sold' FROM pizza_sales;

/*Total Orders */
SELECT COUNT(DISTINCT order_id) AS Total_Orders FROM pizza_sales;

/* Average Pizzas Per Order*/
select round(sum(quantity)/count(distinct(order_id)),2) 'Avg Pizza per Order'
from pizza_sales;

Describe pizza_sales;

/* select dayname(STR_TO_DATE(order_date, '%d-%m-%y')) 'Week day ', order_date
from pizza_sales; */

/* Daily Trend for Total Orders*/

select dayname(STR_TO_DATE(order_date, '%d-%m-%y'))'Week day ', count(distinct(order_id)) 'Total_Order'
from pizza_sales
group by dayname(STR_TO_DATE(order_date, '%d-%m-%y'));

/*Monthly Trend for Orders */
select monthname(STR_TO_DATE(order_date,'%d-%m-%y')) 'Month', count(distinct(order_id)) 'Order Count'
from pizza_sales
group by monthname(STR_TO_DATE(order_date, '%d-%m-%y'));

/* % of Sales by Pizza Category */
select pizza_category, round(sum(total_price),2) as 'Total Revenue',
round(sum(total_price) * 100/(select sum(total_price) from pizza_sales),2) 'Percentage'
from pizza_sales
group by pizza_category;

/* % of Sales by Pizza Size*/
select pizza_size, round(sum(total_price),2) 'Total Revenue',
round(sum(total_price) * 100/ (select sum(total_price) from pizza_sales),2) 'Percentage'
from pizza_sales
group by pizza_size;

/* Total Pizzas Sold by Pizza Category*/
select pizza_category, count(quantity) as 'Pizza_Sold' from pizza_sales
group by pizza_category;


/* Top 5 Pizzas by Revenue */

select pizza_name, sum(total_price) 'Total_Revenue' from pizza_sales
group by pizza_name
order by Total_Revenue desc
limit 5;

/*Bottom 5 Pizzas by Revenue  */
select pizza_name, sum(total_price) 'Total_Revenue' from pizza_sales
group by pizza_name
order by Total_Revenue
limit 5;

/*Top 5 Pizzas by Quantity */
select pizza_name, sum(quantity) 'Total_Pizza_Sold' from pizza_sales
group by pizza_name
order by Total_Pizza_Sold desc
limit 5;


/* Bottom 5 Pizzas by Quantity */
select pizza_name, sum(quantity) 'Total_Pizza_Sold' from pizza_sales
group by pizza_name
order by Total_Pizza_Sold
limit 5;

/*Top 5 Pizzas by Total Orders*/
select pizza_name, count(distinct(order_id)) 'Total_Pizza_orders' from pizza_sales
group by pizza_name
order by Total_Pizza_orders desc
limit 5;


/*Bottom 5 Pizzas by Total Orders*/
select pizza_name, count(distinct(order_id)) 'Total_Pizza_orders' from pizza_sales
group by pizza_name
order by Total_Pizza_orders 
limit 5;
