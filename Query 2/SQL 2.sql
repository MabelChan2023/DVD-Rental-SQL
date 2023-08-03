/*
Objectives:
Retrieve the inventory number of each film in ascending order
*/

SELECT f.title, COUNT(i.inventory_id) AS total_inventory
FROM film f
LEFT JOIN inventory i ON f.film_id = i.film_id
GROUP BY f.film_id, f.title
ORDER BY total_inventory ASC;



