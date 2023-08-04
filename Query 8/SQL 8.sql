/*
Objective:
Retrieve the films that have average payment amount higher than 5
*/

SELECT f.title, (AVG(p.amount)AS average_payment
FROM film f
JOIN inventory i ON i.film_id = f.film_id
JOIN rental r ON r.inventory_id = i.inventory_id
JOIN payment p ON p.rental_id = r.rental_id
GROUP BY f.title
HAVING AVG(p.amount)>5
ORDER BY f.title
;
