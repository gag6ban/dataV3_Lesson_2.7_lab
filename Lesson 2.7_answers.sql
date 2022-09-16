-- Lab | SQL Join (Part I)

USE sakila;

-- Q1 How many films are there for each of the categories in the category table. Use appropriate join to write this query.
SELECT c.name, count(*) as number_movies
FROM category c
JOIN film_category f
WHERE c.category_id = f.category_id
GROUP BY c.name;

-- Q2 Display the total amount rung up by each staff member in August of 2005.
SELECT first_name, last_name, sum(p.amount) as total_amount
FROM payment p
JOIN staff s
ON p.staff_id = s.staff_id
WHERE YEAR (payment_date) = 2005 AND MONTH(payment_date) = 8
GROUP BY first_name;

-- Q3 Which actor has appeared in the most films?
SELECT first_name, last_name, count(first_name) as 'number of movies'
FROM film_actor
JOIN actor using (actor_id)
GROUP BY first_name;

-- Q4 Most active customer (the customer that has rented the most number of films)
SELECT count(rental_id) AS 'Films rented', first_name, last_name
FROM sakila.customer c
JOIN sakila.rental r
ON c.customer_id = r.customer_id
GROUP BY c.customer_id
ORDER BY count(rental_id) DESC;


-- Q5 Display the first and last names, as well as the address, of each staff member.
SELECT * FROM sakila.staff;
SELECT first_name AS 'First Name', last_name AS 'Last Name', address AS 'Address1', address2 AS 'Address2', district AS 'District', city_id AS 'City'
FROM sakila.staff s
JOIN sakila.address a
ON s.address_id = a.address_id;

-- Q6 List each film and the number of actors who are listed for that film.
SELECT * FROM sakila.film;
SELECT * FROM sakila.film_actor;
SELECT title AS 'Title', count(actor_id) AS 'Number of actors'
FROM sakila.film f
JOIN sakila.film_actor fa USING (film_id)
GROUP BY title;

-- Q7 Using the tables payment and customer and the JOIN command, list the total paid by each customer. List the customers alphabetically by last name.
SELECT * FROM sakila.customer;
SELECT * FROM sakila.payment;
SELECT customer_id AS 'Cust ID', last_name AS 'Last name', first_name AS 'First name', sum(amount) AS 'Total amount paid'
FROM sakila.customer c
JOIN sakila.payment p USING (customer_id)
GROUP BY customer_id
ORDER BY last_name ASC;

-- Q8 List number of films per category.
