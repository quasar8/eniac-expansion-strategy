-- 1. CATEGORY-LEVEL MONTHLY ORDER TREND
-- Used for: Stacked area chart across key categories
-- (telephony, electronics, computers_accessories)
-- ============================================================================
 
SELECT 
    DATE_FORMAT(o.order_purchase_timestamp, '%Y-%m') AS order_month,
    pt.product_category_name_english AS category,
    COUNT(DISTINCT o.order_id) AS total_orders
FROM orders o
LEFT JOIN order_items oi 
    USING (order_id)
LEFT JOIN products p 
    USING (product_id)
LEFT JOIN product_category_name_translation pt
    USING (product_category_name)
WHERE pt.product_category_name_english IN ('telephony', 'electronics', 'computers_accessories')
  AND o.order_status != 'canceled'
GROUP BY order_month, category
ORDER BY order_month, category;

-- ============================================================================


-- 2. TECH PRODUCTS SHARE OF TOTAL SALES (%)
-- Used for: Key takeaway metric -> "Tech products represent only 3.29%"
SELECT 
    ROUND(
        (SELECT COUNT(DISTINCT p.product_id)
         FROM products p
         JOIN product_category_name_translation pt 
             USING (product_category_name)
         WHERE pt.product_category_name_english IN 
             ('audio', 'computers', 'computers_accessories', 'consoles_games',
              'electronics', 'pc_gamer', 'tablets_printing_image', 'telephony')
        ) 
        / (SELECT COUNT(*) FROM order_items) * 100
    , 2) AS tech_sales_percentage;
    
-- ============================================================================

    
-- 3. AVERAGE TECH PRODUCT PRICE
-- Used for: Key takeaway metric -> "Average product price: $120.65"
SELECT 
    ROUND(AVG(price), 2) AS avg_price
FROM order_items;


-- ============================================================================
-- 4. TECH PRODUCT SALES BY PRICE RANGE
-- Used for: "Popularity of Tech Products by Price Range" bar chart

SELECT
    CASE 
        WHEN t.avg_price < 500  THEN '€0-500'
        WHEN t.avg_price < 1000 THEN '€500-1K'
        WHEN t.avg_price < 1500 THEN '€1K-1.5K'
        WHEN t.avg_price < 2000 THEN '€1.5K-2K'
        WHEN t.avg_price < 2500 THEN '€2K-2.5K'
        WHEN t.avg_price < 3000 THEN '€2.5K-3K'
        WHEN t.avg_price < 3500 THEN '€3K-3.5K'
        WHEN t.avg_price < 6000 THEN '€5.5K-6K'
        ELSE '6K+'
    END AS price_range,
    COUNT(*) AS products_sold
FROM (
    SELECT 
        product_id, 
        AVG(price) AS avg_price
    FROM order_items
    GROUP BY product_id
) t
GROUP BY price_range
ORDER BY MIN(t.avg_price);

-- ============================================================================

 -- 5. AVERAGE DELIVERY TIME (DAYS)
-- Used for: Key takeaway metric -> "Average delivery time: 12 days"

SELECT 
    ROUND(AVG(DATEDIFF(order_delivered_customer_date, order_purchase_timestamp)), 1) 
        AS avg_delivery_days
FROM orders
WHERE order_status = 'delivered'
  AND order_delivered_customer_date IS NOT NULL;
  
  -- ============================================================================
-- 6. DELIVERY TIMING BREAKDOWN (ON-TIME vs DELAYED)
-- Used for: Donut chart -> On time 93%, 1-3 day delay 2.0%,

SELECT
    delivery_status,
    order_count,
    ROUND(order_count * 100.0 / SUM(order_count) OVER (), 2) AS percentage
FROM (
    SELECT
        CASE
            WHEN DATEDIFF(order_delivered_customer_date, order_estimated_delivery_date) <= 0 
                THEN 'On time'
            WHEN DATEDIFF(order_delivered_customer_date, order_estimated_delivery_date) BETWEEN 1 AND 3 
                THEN '1-3 day delay'
            WHEN DATEDIFF(order_delivered_customer_date, order_estimated_delivery_date) BETWEEN 4 AND 7 
                THEN '4-7 day delay'
            WHEN DATEDIFF(order_delivered_customer_date, order_estimated_delivery_date) BETWEEN 8 AND 100 
                THEN '1 week to 100 day delay'
            ELSE '>100 day delay'
        END AS delivery_status,
        COUNT(DISTINCT order_id) AS order_count,
        MIN(DATEDIFF(order_delivered_customer_date, order_estimated_delivery_date)) AS sort_key
    FROM orders
    WHERE order_status = 'delivered'
      AND order_delivered_customer_date IS NOT NULL
      AND order_estimated_delivery_date IS NOT NULL
    GROUP BY delivery_status
) sub
ORDER BY sort_key;
  