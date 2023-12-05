/*Выберите количество аренд объектов клуба в каждый месяц.*/
USE cd;
SELECT YEAR(starttime) AS Год, MONTH(starttime) AS Месяц, facility AS 'Название объекта', SUM(b.slots) AS 'Количество аренд'
FROM bookings AS b
JOIN facilities AS f ON b.facid = f.facid
GROUP BY YEAR(starttime), MONTH(starttime), facility;