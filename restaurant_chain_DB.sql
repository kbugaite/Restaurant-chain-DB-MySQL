-- Create a new DB called Restaurant chain and all of it's tables
CREATE DATABASE IF NOT EXISTS RESTAURANT_CHAIN;

USE RESTAURANT_CHAIN;

SET FOREIGN_KEY_CHECKS = 0;

CREATE TABLE IF NOT EXISTS BRANCH(
branch_id CHAR(3) NOT NULL,
branch_name VARCHAR(25) NOT NULL,
address VARCHAR(50) NOT NULL,
telephone_number VARCHAR(25) NOT NULL,
city VARCHAR(25) NOT NULL,
manager_id INT NOT NULL,
CONSTRAINT PK_branch_id PRIMARY KEY
(branch_id)
);

CREATE TABLE IF NOT EXISTS Employees(
employee_id INT NOT NULL,
employee_name VARCHAR(25) NOT NULL,
employee_surname VARCHAR(25) NOT NULL,
home_address VARCHAR(50),
telephone_number VARCHAR(25),
date_of_birth DATE NOT NULL,
salary INT NOT NULL,
start_of_employment DATE NOT NULL,
branch_id CHAR(3) NOT NULL,
CONSTRAINT PK_employee_id PRIMARY KEY (employee_id)
);

SELECT * FROM employees;

CREATE TABLE IF NOT EXISTS Delivery_drivers(
driver_id CHAR(3) NOT NULL,
driver_name VARCHAR(25) NOT NULL,
driver_surname VARCHAR(25) NOT NULL,
address VARCHAR(50),
telephone_number VARCHAR(25),
date_of_birth DATE NOT NULL,
weekly_hours INT NOT NULL,
start_of_employment DATE NOT NULL,
branch_id CHAR(3) NOT NULL,
CONSTRAINT PK_driver_id PRIMARY KEY (driver_id)
);

SELECT * FROM delivery_drivers;

CREATE TABLE IF NOT EXISTS Suppliers(
supplier_id CHAR(3) NOT NULL,
supplier_name VARCHAR(25) NOT NULL,
supplier_address VARCHAR(50) NOT NULL,
telephone_number VARCHAR(25),
city VARCHAR(25) NOT NULL,
country VARCHAR(25) NOT NULL,
CONSTRAINT PK_supplier_id PRIMARY KEY (supplier_id)
);

CREATE TABLE IF NOT EXISTS menu_items(
menu_id CHAR(3) NOT NULL,
dish_name VARCHAR(50) NOT NULL,
dish_type VARCHAR(25),
course VARCHAR(25) NOT NULL,
price DECIMAL(4,2) NOT NULL,
main_ingredient INT NOT NULL,
secondary_ingredient INT,
tertiary_ingredient INT,
CONSTRAINT PK_menu_id PRIMARY KEY (menu_id)
);

SELECT * FROM menu_items;

CREATE TABLE IF NOT EXISTS Ingredients(
ingredient_id INT NOT NULL,
ingredient_name VARCHAR(50) NOT NULL,
quantity_kg DECIMAL(5,2) NOT NULL,
price_kg DECIMAL(4,2) NOT NULL,
last_ordered DATE NOT NULL,
best_before DATE NOT NULL,
supplier_id CHAR(3) NOT NULL,
CONSTRAINT PK_ingredientr_id PRIMARY KEY (ingredient_id)
);

SELECT * FROM Ingredients;

CREATE TABLE IF NOT EXISTS Loyal_customers(
customer_id INT NOT NULL,
customer_name VARCHAR(25) NOT NULL,
customer_surname VARCHAR(25) NOT NULL,
date_signed_up DATE NOT NULL,
email VARCHAR(50) NOT NULL UNIQUE,
telephone_number VARCHAR(25) NOT NULL UNIQUE,
CONSTRAINT PK_customer_id PRIMARY KEY (customer_id)
);

SELECT * FROM loyal_customers;

CREATE TABLE IF NOT EXISTS customers_orders(
order_id INT NOT NULL,
customer_id INT,
loyalty_card BOOLEAN NOT NULL,
payment_type VARCHAR(25) NOT NULL,
menu_item CHAR(3) NOT NULL,
branch_id CHAR (3) NOT NULL,
CONSTRAINT PK_order_id PRIMARY KEY (order_id)
);

SELECT * FROM customers_orders;

-- Populate the 'Branch' and 'Suppliers' tables manually as they contain only a few entries

INSERT INTO Branch
(branch_id, branch_name, address, telephone_number, city, manager_id)
VALUES
('B0', 'Main office', '12, Princes St', '+441234555566', 'London', 1),
('B1', 'Soho', '6 Brewer St', '+441294423521', 'London', 2),
('B2', 'Grand Central', '12 Stephenson St', '+441220405094', 'Birmingham', 3),
('B3', 'Castle Park', '3 Lower Castle St', '+445820499014', 'Bristol', 4),
('B4', 'Kirkgate', '80 Kirkgate', '+447820499017', 'Leeds', 5),
('B5', 'Riverside', '16 Romilly Crescent', '+447138809435', 'Cardiff', 6),
('B6', 'Station', '400 Station Rd', '+447651807831', 'York', 7),
('B7', 'Old town', '114 George St', '+447231440012', 'Edinburgh', 8);

SELECT * FROM Branch;

INSERT INTO suppliers
(supplier_id, supplier_name, supplier_adress, telephone_number, city, country)
VALUES
('S01', 'Nisbets Plc.', 'Nisbets Plc, Fourth Way, Avonmouth', '+441173165000', 'Bristol', 'United Kingdom'),
('S02', 'Sysco', 'New Mill Road, St. Paul’s Cray, Kent', '+441689301201', 'London', 'United Kingdom'),
('S03', 'CIBOSANO Ltd', 'Unit 4, I.O.Centre, Lea Road Waltham Cross', '+441992804716', 'Hertfordshire', 'United Kingdom' ),
('S04', 'Cooks Mill', '1 Comus Street', '+441618864989', 'Manchester', 'United Kingdom'),
('S05', 'Italian Food', 'Via Mazzini, 6 - 4312', '+391756990345', 'Parma', 'Italy'),
('S06', 'Euro Wild', '11 rue Lhote', '+33557357474', 'Bordeaux', 'France'),
('S07', 'Gastro-Import A/S Norge', 'Postboks 2477 Solli', '+4724119700', 'Oslo', 'Norway'),
('S08', 'Gastro Import Denmark ApS', 'Kanalholmen 19', '+4548475511', 'Hvidovre', 'Denmark'),
('S09', 'Gastro Import Sverige AB', 'La Cours gata 6', '+4642296000', 'Helsingborg', 'Sweden'),
('S10', 'Basco', 'Unit 427C Birch Park, Thorp Arch Estate', '+441937845767', 'Wetherby', 'United Kingdom'),
('S11', 'Majo Foods', 'Plaza Lesseps 33, Entresuelo 4', '+34626680511', 'Barcelona', 'Spain');

SELECT * FROM suppliers;

-- Populate 'Menu items', 'Ingredients', 'Employees', 'Delivery drivers' and 'Loyal customers' tables automatically by inserting data through a CVS file into a table as it contains many entries.
-- Insert some sample data of transactions manually into 'Customers orders' table as a procedure would do it automatically after each purchase.

INSERT INTO customers_orders
(order_id, customer_id, loyalty_card, payment_type, menu_item, branch_id)
VALUES
(5500, NULL, FALSE, 'Card', 'S10', 'B3'),
(5501, NULL, FALSE, 'Card', 'M4', 'B3'),
(5502, NULL, FALSE, 'Card', 'D2', 'B3'),
(5503, NULL, FALSE, 'Card', 'W21', 'B3'),
(5504, NULL, FALSE, 'Card', 'W23', 'B3'),
(5505, 11032, True, 'Card', 'D8', 'B1'),
(5506, 11032, True, 'Card', 'W6', 'B1'),
(5507, 11046, True, 'Cash', 'M1', 'B5'),
(5508, 11046, True, 'Cash', 'M12', 'B5'),
(5509, 11046, True, 'Cash', 'M19', 'B5'),
(5510, 11046, True, 'Cash', 'D11', 'B5'),
(5511, 11046, True, 'Cash', 'W24', 'B5'),
(5512, 11046, True, 'Cash', 'W13', 'B5'),
(5513, 11046, True, 'Cash', 'W12', 'B5'),
(5514, 11116, True, 'Card', 'M5', 'B1'),
(5515, 11116, True, 'Card', 'M5', 'B1'),
(5516, 11116, True, 'Card', 'M28', 'B1'),
(5517, 11116, True, 'Card', 'D9', 'B1'),
(5518, 11116, True, 'Card', 'W5', 'B1'),
(5519, 11116, True, 'Card', 'W12', 'B1'),
(5520, 11116, True, 'Card', 'W25', 'B1'),
(5521, NULL, False, 'Cash', 'W4', 'B4'),
(5522, NULL, False, 'Cash', 'D6', 'B4');

-- PROCEDURE - Automatically inserts relevant information into 'customers_orders' table after each purchase is made.

DELIMITER // 
CREATE PROCEDURE add_order(
IN order_id INT,
IN customer_id INT,
IN loyalty_card BOOLEAN,
IN payment_type VARCHAR(25),
IN menu_item CHAR(3),
IN branch_id CHAR (3)
)
BEGIN
INSERT INTO customers_orders(order_id, customer_id, loyalty_card, payment_type, menu_item, branch_id)
VALUES(order_id, customer_id, loyalty_card, payment_type, menu_item, branch_id);
END//
DELIMITER ;

-- And here we add some values by calling PROCEDURE 'add_order'
call add_order(5523, 11119, True, 'Card', 'D2', 'B2');
call add_order(5524, 11119, True, 'Card', 'W3', 'B2');

SELECT * FROM customers_orders;

-- Analysis of the menu courses by using COUNT, SUM, MAX, MIN in-built functions with GROUP BY course and ORDER BY course with highest amount of items to choose from (main dishes in this case).
-- I had to use WHERE m.course != '' as there was one empty field showing up to omit it from analysis results.

SELECT  m.course, COUNT(m.dish_name) AS amount_of_dishes_in_course, sum(m.price) AS total_course_price,
ROUND(avg(m.price),2) AS average_course_dish_price, min(m.price) AS min_course_dish_price, max(m.price) AS max_course_dish_price
FROM menu_items AS m
WHERE m.course != ''
GROUP BY m.course
ORDER BY COUNT(m.dish_name) DESC;

-- Now instead of analysing menu by courses, we use type of each dish if it has it assigned ('non-veg' = non vegetarian, 'veg' = vegetarian, 'vegan' = vegan) and analyse it by same conditions. 
-- Note: drinks don't fall into any of the cathegories.

SELECT  m.dish_type, COUNT(m.dish_name) AS amount_of_dishes_by_type, sum(m.price) AS total_price_by_type,
ROUND(avg(m.price),2) AS average_dish_price_by_type, min(m.price) AS min_dish_price_by_type, max(m.price) AS max_dish_price_by_type
FROM menu_items AS m
WHERE m.dish_type != ''
GROUP BY m.dish_type
ORDER BY COUNT(m.dish_name) DESC;

-- Analysis of dishes using the same main ingredient where we also show the ingredient name by using JOIN from 'Ingredients' table.
-- We use HAVING clause where we omit results of ingredients used in only 1 recipe and we order our results by ingredients used in highest amount of recipes.

SELECT m.main_ingredient AS main_ingredient_id, i.ingredient_name, COUNT(main_ingredient) AS dishes_using_same_main_ingredient
FROM menu_items m
LEFT JOIN ingredients i
ON m.main_ingredient = i.ingredient_id
GROUP BY m.main_ingredient
HAVING COUNT(m.main_ingredient) >1
ORDER BY COUNT(m.main_ingredient) DESC;

-- QUERY WITH A SUBQUERY - in this example customer is only looking for vegan dishes which have olives or sweet potatoes as their main ingredients.

SELECT m.dish_name, m.dish_type, m.course, m.price
FROM menu_items AS m
WHERE m.dish_type ='vegan' AND m.main_ingredient IN
(SELECT i.ingredient_id
FROM ingredients AS i
WHERE  i.ingredient_name = 'olives' OR i.ingredient_name = 'sweet potato')
ORDER BY m.price;

-- VIEW that uses Inner join that connects 'Branch'and 'Employees' tables and shows first and last names of managers in charge of each branch without showing any of their personal data to protect their privacy.
-- Then it uses a left join which connects each Branch and their respective Managers and their work numbers to list all of the delivery drivers working for each branch.
-- A view like this could be used by an outsourcing agency that employs drivers. For convenience it's ordered by driver's surname alphabetically.

CREATE VIEW v_delivery_drivers_agency_info AS
SELECT b.branch_id, e.employee_name AS managers_first_name, e.employee_surname AS managers_surname, b. telephone_number,
b.branch_name, b.city, d.driver_name, d.driver_surname, d.weekly_hours, d.telephone_number AS drivers_phone_number
FROM branch b
INNER JOIN employees e
ON b.manager_id = e.employee_id
LEFT JOIN delivery_drivers d
ON b.branch_id=d.branch_id
ORDER BY d.driver_surname;

-- FUNCTION - Calculates the final price of each item ordered and gives customer a discount if they present a loyalty card.

DELIMITER //
CREATE FUNCTION final_item_price(price DECIMAL(4,2), loyalty_card BOOLEAN)
RETURNS DECIMAL(4,2)
DETERMINISTIC
BEGIN
DECLARE final_price DECIMAL(4,2);
IF loyalty_card = FALSE THEN
SET final_price = price;
ELSEIF loyalty_card = TRUE THEN
SET final_price = price * 0.9;
END IF;
RETURN(final_price);
END//
DELIMITER ;

-- INNER JOIN - Sums up orders of specified customer by using their ID in WHERE clause to filter only for that customer's orders, then using user defined 'final_item_price' function to refresh
-- each items price if that customer has presented a loyalty card and in-built SUM function to calculate total amount this customer needs to pay.

SELECT c.customer_id, sum(m.price) AS original_price, sum(final_item_price(m.price, c.loyalty_card)) AS final_bill
FROM customers_orders c
INNER JOIN menu_items m
ON c.menu_item =  m.menu_id
WHERE c.customer_id ='11046';
    
-- EVENT - this event checks the ingredients table for items which are past their best before date at the start of every shift - every 8 hours,
-- notes which item it is with its ID and provides a timestamp when this event checked the database.

CREATE TABLE out_of_date_products (
    product_id INT NOT NULL,
    product_name VARCHAR(50) NOT NULL,
    message VARCHAR(250) NOT NULL,
    checked_at DATETIME
);

UPDATE ingredients
SET best_before = '2022-09-04'
WHERE ingredient_id = 46;

SELECT * FROM out_of_date_products; 

SET GLOBAL event_scheduler = ON;

DELIMITER //
CREATE EVENT IF NOT EXISTS expiry_date
ON SCHEDULE EVERY 8 HOUR
DO
BEGIN
  INSERT INTO out_of_date_products (product_id, product_name, message, checked_at)
  SELECT I.ingredient_id, i.ingredient_name, 'This product is past its expiry date. Please, order more.', NOW()
  FROM ingredients i
  WHERE i.best_before < CURRENT_DATE();
END//
DELIMITER ;

SHOW EVENTS FROM restaurant_chain;s

-- EXTRAS
-- I was getting an error code when trying to link ingredients and their IDs on menu_items table, so I had to disable foreign key checks at the start of the database and reset it to default after I changed the FK relations.
SET FOREIGN_KEY_CHECKS = 1;

create database restaurant_chain_restore;