/*
 * List the name of all actors who have appeared in a movie that has the 'Behind the Scenes' special_feature
 */

SELECT DISTINCT first_name || ' ' || last_name AS "Actor Name"
FROM actor
WHERE actor_id IN (
    SELECT actor_id
    FROM actor 
    Join film_actor using (actor_id)
    Join film using (film_id)
    WHERE 'Behind the Scenes'= ANY(special_features)
) 
Order By "Actor Name";

