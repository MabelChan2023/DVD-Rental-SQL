/*
Objective:
Retrieve the total payment of customers that have words 
that starts with "M" and are at least 5 characters in length in their first name
*/

SELECT c.first_name, SUM(p.amount) AS total_payment
FROM customer c
JOIN rental r ON r.customer_id = c.customer_id
JOIN payment p ON p.rental_id = r.rental_id
WHERE c.first_name LIKE 'M____%'
GROUP BY first_name
ORDER BY first_name
;