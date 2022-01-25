#1) How many times has each vendor rented a booth?
SELECT vendor_id, COUNT(*) AS num_assignments
FROM farmers_market.vendor_booth_assignments
GROUP BY vendor_id;

#2) When is each type of fresh fruit or vegetable in season, locally?
SELECT pc.product_category_name,
	p.product_name,
	MIN(v.market_date) AS earliest_date,
    MAX(v.market_date) AS latest_date	
FROM farmers_market.vendor_inventory AS v
	LEFT JOIN product AS p
		ON v.product_id = p.product_id
    LEFT JOIN farmers_market.product_category AS pc
		ON p.product_category_id = pc.product_category_id
WHERE product_category_name = 'Fresh Fruits & Vegetables'
GROUP BY v.product_id;

#3) Customers who have spent more than $50 at the market
SELECT c.customer_last_name,
	c.customer_first_name,
    SUM(cp.cost_to_customer_per_qty * cp.quantity) AS total_spent
FROM customer_purchases AS cp
	LEFT JOIN customer AS c
		ON cp.customer_id = c.customer_id
GROUP BY c.customer_last_name, c.customer_first_name
HAVING total_spent > 50
