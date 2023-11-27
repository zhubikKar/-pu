/*Составьте список объектов вместе с их общим доходом. Выходная таблица 
должна состоять из названия объекта и доходов, отсортированных по доходам. 
Помните, что для гостей и участников действуют разные цены!*/
USE cd;
SELECT f.facility AS 'Название объекта',
    SUM(CASE WHEN b.memid = 0 THEN f.guestcost * b.slots
        ELSE f.membercost * b.slots END) AS Proflot
FROM facilities AS f
LEFT JOIN bookings AS b ON b.facid = f.facid
GROUP BY f.facility
ORDER BY Proflot DESC;