/*
Objective:
Retrieve the address id, name, district, phone of Canada customer with total payment amount in descending order  
*/

WITH Canada_address_phone AS
(SELECT a.address_id, a.district, a.phone
 FROM address a
 WHERE a.city_id IN
	(SELECT ci.city_id
	 FROM city ci
	 JOIN country co ON ci.country_id = co.country_id
	 WHERE co.country = 'Canada')
),

Canada_customer AS 
(SELECT c.first_name, c.last_name, c.address_id, SUM(p.amount)AS total_payment
 FROM customer c
 JOIN Canada_address_phone cap ON c.address_id = cap.address_id
 JOIN payment p ON c.customer_id = p.customer_id
 GROUP BY c.first_name, c.last_name, c.address_id
)

SELECT *
FROM Canada_customer
NATURAL JOIN Canada_address_phone
ORDER BY Canada_customer.total_payment DESC
;