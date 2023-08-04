/*
Objective:
Retrieve the average payment amount spent by customers in different countries
*/

SELECT co.country, CAST(AVG(pa.amount) AS DECIMAL(10,2)) AS average_rental_payment
FROM country co
JOIN city ci ON ci.country_id = co.country_id 
JOIN address ad ON ad.city_id = ci.city_id
JOIN customer cu ON cu.address_id = ad.address_id
JOIN payment pa ON pa.customer_id = cu.customer_id
GROUP BY co.country
ORDER BY average_rental_payment DESC
;