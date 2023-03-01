/*
 * List the title of all movies that have both the 'Behind the Scenes' and the 'Trailers' special_feature
 *
 * HINT:
 * Create a select statement that lists the titles of all tables with the 'Behind the Scenes' special_feature.
 * Create a select statement that lists the titles of all tables with the 'Trailers' special_feature.
 * Inner join the queries above.
 */

SELECT title
FROM film
JOIN film_category USING(film_id)
JOIN category USING(category_id)
WHERE 'Behind the Scenes' = ANY(special_features)
AND 'Trailers' = ANY(special_features)
ORDER BY title;
