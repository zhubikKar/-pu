/*Рассчитайте количество аренд каждого из объектов клуба.*/
USE cd;
SELECT facility AS 'Объекты клуба', SUM(b.slots) AS 'Кол-во аренд'
FROM facilities AS f
INNER JOIN bookings AS b ON b.facid = f.facid
GROUP BY f.facid;