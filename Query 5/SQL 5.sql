/*
Objective:
Retrieve the average payment amount processed by the stores by country
*/

SELECT co.country, COUNT(ad.address_id)
FROM country co
JOIN city ci ON ci.country_id = co.country_id 
JOIN address ad ON ad.city_id = ci.city_id
--JOIN store st ON st.address_id = ad.address_id
GROUP BY co.country
ORDER BY co.country
;
