#1)
SELECT *
FROM farmers_market.vendor as ven
	INNER JOIN farmers_market.vendor_booth_assignments AS vb
    ON ven.vendor_id = vb.vendor_id
ORDER BY vendor_name, market_date;

#2) 
SELECT * 
FROM customer_purchases as cp
	LEFT JOIN customer AS c 
    ON cp.customer_id = c.customer_id;
#3) "When is each type of fresh fruit or veggie in season, locally
# Look at the 3 tables.
SELECT * FROM product;
SELECT * FROM product_category;
SELECT * FROM vendor_inventory;

# Vendor inventory lists what products are available when
# Product gives information on the product, along with the category id
# product_cat gives info on the category id
# This will produce market dates that each product in the 
# fresh fruit & veggie category was available
SELECT v.product_id, v.market_date, pc.product_category_name,
	p.product_name
FROM farmers_market.vendor_inventory AS v
	LEFT JOIN product AS p
    ON v.product_id = p.product_id
    LEFT JOIN farmers_market.product_category AS pc
    ON p.product_category_id = pc.product_category_id
WHERE product_category_name = 'Fresh Fruits & Vegetables'
LIMIT 5000;