# 1)
SELECT product_id, product_name,
	CASE 
    WHEN product_qty_type = 'unit' THEN 'unit'
        ELSE 'bulk'
        END
        AS prod_qty_type_condensed
FROM farmers_market.product;

#2) 
SELECT product_id, product_name,
	CASE 
    WHEN product_qty_type = 'unit' THEN 'unit'
        ELSE 'bulk'
        END
        AS prod_qty_type_condensed,
	CASE 
		WHEN LOWER(product_name) LIKE '%pepper%' THEN 1
        ELSE 0
        END
        AS pepper_flag
FROM farmers_market.product;

#3) If they just say "Habanero" instead of adding pepper, or
# if pepper is spelled wrong.