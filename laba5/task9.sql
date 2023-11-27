/*Создайте список объектов с общим доходом менее 1000. Создайте выходную таблицу, 
состоящую из названия объекта и дохода, отсортированного по доходу. Помните, что 
для гостей и участников действуют разные цены!*/
USE cd;
SELECT f.facility AS 'Название объекта',
       SUM(CASE WHEN b.memid = 0 THEN f.guestcost * b.slots
                ELSE f.membercost * b.slots END) AS Proflot
FROM facilities AS f
LEFT JOIN bookings AS b ON b.facid = f.facid
GROUP BY f.facility
HAVING Proflot < 1000
ORDER BY Proflot DESC;