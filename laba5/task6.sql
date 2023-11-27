/*Составьте список общего количества бронирований 
на каждый объект в месяц в 2012 году.*/
USE cd;
SELECT f.facility AS 'Объект', MONTH(b.starttime) AS 'Месяц', SUM(b.slots) AS 'Кол-во бронирований'
FROM facilities AS f
INNER JOIN bookings AS b ON f.facid = b.facid WHERE YEAR(b.starttime) = 2012
GROUP BY f.facility, MONTH(b.starttime); 