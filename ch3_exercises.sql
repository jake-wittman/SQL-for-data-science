# Ch 3 exercises

# 1)
SELECT *
FROM farmers_market.customer_purchases
WHERE product_id = 4 OR product_id = 9;

#2)
SELECT *
FROM farmers_market.customer_purchases
WHERE vendor_id >= 8 AND vendor_id <= 10;

SELECT * 
FROM farmers_market.customer_purchases
WHERE vendor_id BETWEEN 8 and 10;

#3)
# Change 1 to 0
SELECT
market_date,
customer_id,
vendor_id,
quantity * cost_to_customer_per_qty price
FROM farmers_market.customer_purchases
WHERE
market_date IN
(
SELECT market_date
FROM farmers_market.market_date_info
WHERE market_rain_flag = 0
);

# Change = to !=
SELECT
market_date,
customer_id,
vendor_id,
quantity * cost_to_customer_per_qty price
FROM farmers_market.customer_purchases
WHERE
market_date IN
(
SELECT market_date
FROM farmers_market.market_date_info
WHERE market_rain_flag != 1
);