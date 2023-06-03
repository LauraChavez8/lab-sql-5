USE sakila;
-- Number 1
ALTER TABLE sakila.staff
DROP COLUMN picture;

-- Number 2
SELECT first_name, last_name, address_id, email, store_id, active FROM sakila.customer
WHERE first_name = 'TAMMY' AND last_name = 'SANDERS';

INSERT INTO sakila.staff (first_name, last_name, address_id, email, store_id, active, username) 
SELECT first_name, last_name, address_id, email, store_id, active, 'tammy' FROM sakila.customer
WHERE first_name = 'TAMMY' AND last_name = 'SANDERS';

-- Number 3

SELECT * FROM sakila.film
WHERE title = "Academy Dinosaur";
SELECT * FROM sakila.inventory
WHERE film_id = 1;
SELECT * FROM sakila.customer
WHERE first_name = 'CHARLOTTE' AND last_name = 'HUNTER';
SELECT * FROM sakila.staff
WHERE store_id = 1;

INSERT INTO sakila.rental (rental_date, inventory_id, customer_id, return_date, staff_id)
VALUES (current_date(),1,130,current_date()+6, 1);

-- Number 4
-- Delete non-active users, but first, create a backup table deleted_users to store customer_id, email, and the date for the users that would be deleted. Follow these steps:
-- Check if there are any non-active users
-- Create a table backup table as suggested
-- Insert the non active users in the table backup table
-- Delete the non active users from the table customer
SELECT * FROM sakila.customer
WHERE active = 0;
CREATE TABLE delete_users (
    customer_id int,
    email varchar(50),
    last_aupdate TIMESTAMP
);
INSERT INTO sakila.delete_users (customer_id, email, last_aupdate) 
SELECT customer_id, email, current_date() FROM sakila.customer
WHERE active = 0;
DELETE FROM sakila.customer 
WHERE active = 0;
