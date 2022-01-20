# Chapter 2 queries
# 1)
SELECT * FROM farmers_market.customer;
# 2)
SELECT * FROM farmers_market.customer
ORDER BY customer_last_name, customer_first_name
LIMIT 10;
# 3)
SELECT customer_id, customer_first_name AS first_name
FROM farmers_market.customer
ORDER BY first_name;
