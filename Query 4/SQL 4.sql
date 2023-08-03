/*
Objective:
Retrieve the average rental payment of Comedy films in April in descending order with film length longer than 90 mins
*/

SELECT f.title,CAST(AVG(p.amount)AS DECIMAL(10,2))AS average_rental_payment
FROM category c

JOIN film_category fc ON c.category_id = fc.category_id
JOIN film f ON fc.film_id = f.film_id
JOIN inventory i ON i.film_id = fc.film_id
JOIN rental r ON r.inventory_id = i.inventory_id
JOIN payment p ON p.rental_id = r.rental_id

WHERE c.name='Comedy' AND f.length >90 AND EXTRACT(MONTH FROM p.payment_date) = 4
GROUP BY f.title, EXTRACT(MONTH FROM p.payment_date)
ORDER BY average_rental_payment DESC
;
