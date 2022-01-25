#1a) Number each customer's vistis to the market with a different number
SELECT *,
	ROW_NUMBER() OVER (PARTITION BY customer_id ORDER BY market_date) AS visit_num
FROM customer_purchases
GROUP BY customer_id, market_date;

SELECT *,
	DENSE_RANK() OVER (PARTITION BY customer_id ORDER BY market_date) AS visit_num
FROM customer_purchases;

#1b) Reverse the numbering and filter to most recent visit
SELECT * FROM (
SELECT customer_id, market_date,
	ROW_NUMBER() OVER (PARTITION BY customer_id ORDER BY market_date DESC) AS visit_num
FROM customer_purchases
GROUP BY customer_id, market_date
) as x
WHERE x.visit_num = 1;

#2) 
SELECT *,
    COUNT(product_id) OVER (PARTITION BY customer_id, product_id) AS product_count
FROM customer_purchases
ORDER BY customer_id, market_date;

#3)
SELECT market_date,
	SUM(quantity * cost_to_customer_per_qty) AS price,
    LEAD(SUM(quantity * cost_to_customer_per_qty), 1) OVER (ORDER BY market_date DESC) AS
		lag_price
FROM customer_purchases
GROUP BY market_date
ORDER BY market_date;
    