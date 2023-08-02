/*
Aim: 
Retrive the number of English Sports films that have rental duration longer than 
the rental duation average of all films
*/

SELECT ca.name, COUNT(f.film_id) AS film_count
FROM film AS f
JOIN language l ON f.language_id = l.language_id
JOIN film_category fc ON f.film_id = fc.film_id
JOIN category ca ON fc.category_id = ca.category_id
WHERE f.rental_duration > 
	(SELECT AVG(rental_duration)FROM film)
AND f.language_id =
	(SELECT language_id FROM language WHERE name = 'English')
AND f.film_id IN
	(SELECT film_id FROM film_category WHERE category_id=
		(SELECT category_id FROM category WHERE name = 'Sports') 
	)
GROUP BY ca.name
ORDER BY film_count DESC;


