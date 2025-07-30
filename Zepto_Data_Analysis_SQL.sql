drop table if exists zepto;

create table zepto(
sku_id SERIAL PRIMARY KEY,
category VARCHAR(120),
name VARCHAR(150),
mrp NUMERIC(8,2),
discountPercent NUMERIC,
availableQuantity INTEGER,
discountedSellingPrice NUMERIC(8,2),
weightInGms INTEGER,
outOfStock BOOLEAN,
quantity INTEGER
);

--data exploration

--count of rows
SELECT COUNT(*) FROM zepto;

--sample data

SELECT * FROM zepto
LIMIT 10;


--checking null values
SELECT * FROM zepto
WHERE name IS NULL
OR
category IS NULL
OR
mrp IS NULL
OR
discountPercent IS NULL
OR
discountedSellingprice IS NULL
OR
availableQuantity IS NULL
OR
weightInGms IS NULL
OR
outOfStock IS NULL
OR
quantity IS NULL;

--different product categories
SELECT DISTINCT category
FROM zepto
ORDER BY category;


--products in stock vs out of stock
SELECT outOfStock, COUNT(sku_id)
FROM zepto
GROUP BY outOfStock;

--product names present multiple times
SELECT name , count(sku_id) as "Number of SKUs"
from zepto
group by name
having count(sku_id)>1
order by count(sku_id) desc;

--data cleaning

--products with price 0
select * from zepto
where mrp = 0 or discountedsellingprice = 0;

delete from zepto
where mrp = 0;

--convert paise to rupees
update zepto
set mrp = mrp/100.0,
discountedSellingPrice = discountedSellingPrice/100.0;

select mrp, discountedsellingprice from zepto;

select * from zepto;

--Q1. Find the top 10 best-value products based on the discount percentage?
select distinct name, mrp, discountpercent
from zepto
order by discountpercent desc
limit 10;

--Q2. What are the products with High MRp but out of stock
select distinct name, mrp
from zepto 
where outofstock = TRUE and mrp>300
order by mrp desc;

--Q3. Calculate estimated revenue of each category
SELECT category,
SUM(discountedsellingprice * availableQuantity) AS total_revenue
from zepto
group by category
order by total_revenue;

--Q4. Find all products where MRP is greater than 500 and discount is less than 10%
select distinct name, mrp, discountpercent
from zepto
where mrp > 500 and discountpercent < 10
order by mrp desc, discountpercent desc;

--Q5. Identify the top 5 categories offering the highest  average discount percentage
select category,
ROUND(avg(discountpercent),2) as avg_discount
from zepto
group by category
order by avg_discount desc
limit 5;

--Q6 Find the price per gram for products above 100g and sort by best value.
select distinct name,weightingms,discountedsellingprice,
round(discountedsellingprice/weightingms,2) as price_per_gram
from zepto 
where weightingms >=100
order by price_per_gram;
--Q7 Group the products into categories like low, medium, bulk
select distinct name, weightingms,
case when weightingms < 1000 then 'Low'
when weightingms < 5000 then 'Medium'
else 'bulk'
end as weight_category
from zepto;

--Q8 What is the total inventory weight per category
select category,
sum(weightingms * availablequantity) as total_weight
from zepto
group by category
order by total_weight;