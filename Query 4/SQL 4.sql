/*
Objective:
Retrieve Comedy films with film length longer than 100 mins 
and average rental payment higher than 5 in April in descending order
*/

SELECT f.title,CAST(AVG(p.amount)AS DECIMAL(10,2))AS average_rental_payment
FROM category c

JOIN film_category fc ON c.category_id = fc.category_id
JOIN film f ON fc.film_id = f.film_id
LEFT JOIN inventory i ON i.film_id = fc.film_id
LEFT JOIN rental r ON r.inventory_id = i.inventory_id
LEFT JOIN payment p ON p.rental_id = r.rental_id

WHERE c.name='Comedy' AND f.length >100 AND EXTRACT(MONTH FROM p.payment_date) = 4
GROUP BY f.title, EXTRACT(MONTH FROM p.payment_date)
HAVING AVG(p.amount) > 5
ORDER BY average_rental_payment DESC
;

