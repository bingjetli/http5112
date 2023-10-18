--BAILEY LIANG	ASSIGNMENT 4 GROUPING RESULTS
--Put your answers on the lines after each letter. E.g. your query for question 1A should go on line 5; your query for question 1B should go on line 7...
-- 1 
--A
SELECT MIN(price) FROM `stock_items`;
--B
SELECT MAX(price) FROM `stock_items`;

-- 2
--A
SELECT COUNT(id), role FROM `employees` GROUP BY role;
--B
SELECT role, COUNT(phone), COUNT(id) FROM `employees` GROUP BY role;

-- 3
--A
SELECT category AS 'Mammals', COUNT(item) 
FROM `stock_items` 
WHERE category != 'Piscine' 
GROUP BY category;
--B
SELECT SUM(inventory) AS 'In Stock', category AS 'Animal' 
FROM `stock_items` 
WHERE inventory > 0 
GROUP BY category 
ORDER BY SUM(inventory) ASC;
--C
SELECT b.item as 'Item', a.price AS 'Highest Price', a.category AS ' Category' 
FROM (SELECT MAX(price) AS 'price', category FROM `stock_items` GROUP BY category) AS a 
INNER JOIN (SELECT * FROM `stock_items`) AS b 
ON a.price = b.price AND a.category = b.category 
ORDER BY a.price ASC;
--D
SELECT b.item as 'Item', a.price AS 'Highest Price', a.category AS ' Category' 
FROM (SELECT MAX(price) AS 'price', category FROM `stock_items` GROUP BY category) AS a 
INNER JOIN (SELECT * FROM `stock_items`) AS b 
ON a.price = b.price AND a.category = b.category 
WHERE a.price > 50
ORDER BY a.price ASC;