/*
 * Select the title of all 'G' rated movies that have the 'Trailers' special feature.
 * Order the results alphabetically.
 * HINT:
 * Use `unnest(special_features)` in a subquery.
 */

SELECT title
FROM film
JOIN film_category USING(film_id)
JOIN category USING(category_id)
WHERE rating = 'G'
AND 'Trailers' = ANY(special_features)
ORDER BY title;
