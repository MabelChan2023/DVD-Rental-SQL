/*
Objective:
Retrieve the title and genre of films that bring 
total rental payment amount > 120 with rental duration > 5
*/

SELECT f.title, c.name AS genre ,SUM(p.amount) AS total_rental
FROM film f
JOIN inventory i ON i.film_id = f.film_id
JOIN rental r ON r.inventory_id = i.inventory_id
JOIN payment p ON p.rental_id = r.rental_id
JOIN film_category fc ON fc.film_id = f.film_id
JOIN category c ON c.category_id = fc.category_id

WHERE f.rental_duration > 5
GROUP by f.title, c.name
HAVING SUM(p.amount) > 120
ORDER by total_rental DESC
;