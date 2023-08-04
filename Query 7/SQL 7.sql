/*
Objective:
Retrieve number of Games or Music films of each actor
*/

SELECT a.first_name, a.last_name, count(f.film_id) AS total_number
FROM actor a
JOIN film_actor fa ON fa.actor_id = a.actor_id
JOIN film f ON f.film_id = fa.film_id
JOIN film_category fc ON fc.film_id = f.film_id
JOIN category c ON c.category_id = fc.category_id
WHERE c.name IN('Games', 'Music')
GROUP BY a.first_name, a.last_name
ORDER BY a.first_name
;
