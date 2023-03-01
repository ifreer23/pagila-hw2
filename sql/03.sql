/*
 * Management wants to send coupons to customers who have previously rented one of the top-5 most profitable movies.
 * Your task is to list these customers.
 *
 * HINT:
 * In problem 16 of pagila-hw1, you ordered the films by most profitable.
 * Modify this query so that it returns only the film_id of the top 5 most profitable films.
 * This will be your subquery.
 * 
 * Next, join the film, inventory, rental, and customer tables.
 * Use a where clause to restrict results to the subquery.
 */

SELECT DISTINCT customer.customer_id
FROM customer
JOIN rental USING(customer_id)
JOIN inventory USING(inventory_id)
JOIN (
  SELECT film_id
  FROM (
    SELECT film_id, SUM(amount) AS total_profit
    FROM payment
    JOIN rental USING(rental_id)
    JOIN inventory USING(inventory_id)
    JOIN film USING(film_id)
    GROUP BY film_id
    ORDER BY total_profit DESC
    LIMIT 5
  ) AS top_films
) AS top_films USING(film_id)
ORDER BY customer_id;
