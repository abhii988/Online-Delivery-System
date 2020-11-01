#QUERIES


#To show all the details of the orders placed in the month of February.
SELECT * FROM orders WHERE MONTH(orderDate)="02";

#To show all the details of the products which costs from 100 to 500.
SELECT * FROM products WHERE price>=100 AND price<=500; 

#To show the orderID, name, customerID, orderDate and deliveryStatus of the orders.
SELECT orderID,name,customerID,orderDate,deliveryStatus FROM orders JOIN customers ON orders.customer=customers.customerID; 

#To show the average price of all the products.
SELECT AVG(price) AS "average_price_of_all_products" FROM products;

#To join two tables, customers and payments.
SELECT * FROM customers 
JOIN payments ON customers.customerID = payments.customer; 

#To show the most expensive product that can be bought.
SELECT * FROM products ORDER BY price DESC LIMIT 1;

#To list all the details of the customer(s) have the letter “u” in their name(s).
SELECT * FROM customers WHERE name LIKE "%u%";

#To display the details of payments where a customer’s card (if applicable) expires from the years 2019 to 2021.
SELECT * FROM payments 
WHERE YEAR(cardExpiryDate)>="2019" 
AND YEAR(cardExpiryDate)<="2021"; 

#To show the customerID, customer’s name, orderID, name of the product that they ordered, that product’s details and company’s name of that product using join.
SELECT customers.customerID,customers.name,orders.orderID,products.name AS "product_name", products.details AS "product_description",suppliers.name AS "company" 
FROM customers 
JOIN orders ON customers.customerID = orders.customer
JOIN products ON orders.product = products.productID
JOIN suppliers ON products.supplier=suppliers.supplierID
ORDER BY customerID; 

#To count the total number of deliveries done whilst grouping them with the deliveryStatus.
SELECT deliveryStatus, COUNT(*) AS "total_deliveries" FROM orders GROUP BY deliveryStatus;

