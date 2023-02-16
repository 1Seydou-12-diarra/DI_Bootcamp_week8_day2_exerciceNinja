-- EXERCICE_NINJA
-- To fetch the last 2 customers in alphabetical order (A-Z) excluding the id column, you can use the following SQL query:


SELECT first_name, last_name
FROM customers
ORDER BY last_name DESC
LIMIT 2;

-- Use SQL to delete all purchases made by Scott.

DELETE FROM purchases
WHERE customer_id = (SELECT id FROM customers WHERE first_name = 'Scott');

-- Does Scott still exist in the customers table, even though he has been deleted? Try and find him.

-- To find all purchases and join with the customers table so that Scott's order appears with empty/blank values for the customer's first and last name, you can use a LEFT JOIN as follows:

SELECT c.first_name, c.last_name, i.name, p.quantity_purchased
FROM purchases p
LEFT JOIN customers c ON p.customer_id = c.id
LEFT JOIN items i ON p.item_id = i.id;

-- To find all purchases and join with the customers table so that Scott's order does NOT appear, you can use an INNER JOIN as follows:


SELECT c.first_name, c.last_name, i.name, p.quantity_purchased
FROM purchases p
INNER JOIN customers c ON p.customer_id = c.id AND c.first_name != 'Scott'
INNER JOIN items i ON p.item_id = i.id;