/*Выберите процент использования объектов по месяцам, упорядочив по возрастанию*/
USE cd;
WITH slots as (SELECT facility, SUM(b.slots) AS CostRent,   
DATE_FORMAT(b.starttime, '%y %m') AS YearMonth
FROM facilities AS f
JOIN bookings AS b ON b.facid = f.facid
GROUP BY f.facid, YearMonth)
SELECT s1.facility AS 'Объекты', 
ROUND(s1.CostRent / SUM(s2.CostRent) * 100, 1) AS 'Использование объекта, %',
s1.YearMonth
FROM slots AS s1
JOIN slots AS s2 ON s1.YearMonth = s2.YearMonth
GROUP BY s1.facility, s1.CostRent, s1.YearMonth
ORDER BY 'Использование объекта, %' ASC;