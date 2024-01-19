show databases;
create database oliststore;
use oliststore;

select * from olist_orders_dataset;

select * from olist_products_dataset;

select * from olist_sellers_dataset;

select * from product_category_name_translation;

select * from olist_order_items_dataset;

select * from olist_order_payments_dataset;

select * from olist_order_reviews_dataset;

select * from olist_customers_dataset;

select * from olist_geolocation_dataset;

show tables;

-------------------------------------------------------------------------------------------------------------------------------------
#------------kPI 1 (Weekday vs Weekend (order_purchases_timestamp) payment_statistics)----------------

select
if(weekday(olist_orders_dataset.order_purchase_timestamp) IN (5,6), 'weekend','weekday')as day_type,
sum(olist_order_payments_dataset.payment_value)as total_payment
From
olist_orders_dataset
Inner join olist_order_payments_dataset on olist_orders_dataset.order_id = olist_order_payments_dataset.order_id
group by day_type;


#--------------kpi-2-------Number of Orders with review score 5 and payment type as credit card---------------------

select count(r.order_id), r.review_score,p.payment_type
from olist_order_reviews_dataset r join olist_order_payments_dataset p on r.order_id = p.order_id
where review_score = 5 and payment_type ="credit_card";


#------------kpi-3----------Average number of days taken for order_delivered_customer_date for pet_shop-------------


select round(avg(datediff(order_delivered_customer_date,order_purchase_timestamp))) as avg_day from olist_orders_dataset
join olist_order_items_dataset
using (order_id)
join olist_products_dataset
using (product_id)
where product_category_name = 'pet_shop';

#-------------kpi-4----------Average price and payment values from customers of sao paulo city--------------


SELECT 
  c.customer_city,
ROUND(AVG(i.price)) AS Average_Price,
ROUND(AVG(p.payment_value)) AS Average_Payment
FROM olist_customers_dataset c 
INNER JOIN olist_orders_dataset o ON c.customer_id = o.customer_id
INNER JOIN olist_order_items_dataset i ON o.order_id = i.order_id
INNER JOIN olist_order_payments_dataset p ON o.order_id = p.order_id
WHERE c.customer_city = "sao paulo"
GROUP BY c.customer_city;


#-----kpi-5------Relationship between shipping days (order_delivered_customer_date - order_purchase_timestamp) Vs review scores----


SELECT review_score, round(AVG(DATEDIFF(order_delivered_customer_date, order_purchase_timestamp))) AS avg_shipping_days
FROM olist_orders_dataset o
INNER JOIN olist_order_reviews_dataset r
  ON o.order_id = r.order_id
GROUP BY review_score 
order by (review_score) desc;
































