SELECT * FROM pizza_sales_portfolio.pizza_sales;

/* Finding the total revenue */
select round(sum(total_price),2) as total_revenue from pizza_sales_portfolio.pizza_sales ;

/* Finding the average order value */
select round(sum(total_price)/count(distinct order_id),2) as avg_order_value 
from pizza_sales_portfolio.pizza_sales ;

/* Finding the total pizza sold */
select sum(quantity) as total_pizza_sold from pizza_sales_portfolio.pizza_sales ;

/* finding the total orders */
select count(distinct order_id) as total_orders 
from pizza_sales_portfolio.pizza_sales ;

/* Finding the average pizzas per order */
select round(sum(quantity)/count(distinct order_id),2) as average_pizzas_per_order 
from pizza_sales_portfolio.pizza_sales ;

/* Daily trend for total orders */
select dayname(order_date) as order_day, count(distinct order_id) as total_orders 
from pizza_sales_portfolio.pizza_sales
group by dayname(order_date) order by count(distinct order_id) desc ;

/* Hourly trend for total orders */
select hour(order_time) as order_hours, count(distinct order_id) as total_orders 
from pizza_sales_portfolio.pizza_sales
group by hour(order_time) ;

/* Percentage of sales by pizza category */
select pizza_category, round(sum(total_price),2) as total_sales, round(sum(total_price)*100 /
(select sum(total_price) from pizza_sales_portfolio.pizza_sales),2) as percentage_of_total_sales
from pizza_sales_portfolio.pizza_sales
group by pizza_category ;

/* Percentage of sales by pizza size */
select pizza_size, round(sum(total_price),2) as total_revenue, round(sum(total_price)*100 /
(select sum(total_price) from pizza_sales_portfolio.pizza_sales),2) as percentage_of_total_sales
from pizza_sales_portfolio.pizza_sales
group by pizza_size 
order by percentage_of_total_sales desc ;

/* Total pizzas sold by pizza category */
select pizza_category, sum(quantity) as total_pizzas_sold
from pizza_sales_portfolio.pizza_sales
group by pizza_category ; 

/* Top 5 best sellers by total pizza sold */
select pizza_name, sum(quantity) as total_pizzas_sold
from pizza_sales_portfolio.pizza_sales
group by pizza_name
order by sum(quantity) desc limit 5;

/* Bottom 5 worst sellers by total pizza sold */
select pizza_name, sum(quantity) as total_pizzas_sold
from pizza_sales_portfolio.pizza_sales
group by pizza_name
order by sum(quantity) asc limit 5;













