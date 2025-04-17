WITH ProductSales AS (
    SELECT product_id, SUM(amount) AS total_sales
    FROM sales
    GROUP BY product_id
),
TopProducts AS (
    SELECT product_id
    FROM ProductSales
    WHERE total_sales > 8000000000
)
SELECT p.product_id, p.product_name, ps.total_sales
FROM TopProducts tp
JOIN products p ON tp.product_id = p.product_id
JOIN ProductSales ps ON ps.product_id = p.product_id;