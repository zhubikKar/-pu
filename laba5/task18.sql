/*Для каждого дня августа 2012 года рассчитайте скользящее 
среднее общего дохода за предыдущие 15 дней. Вывод должен 
содержать столбцы даты и дохода, отсортированные по дате. 
Не забудьте учесть возможность того, что в день будет нулевой доход. 
Примечание: используйте DATE_ADD для генерации серии дат.*/
USE cd;
WITH RECURSIVE DateRange AS (
    SELECT '2012-08-01' AS Date
    UNION ALL
    SELECT DATE_ADD(Date, INTERVAL 1 DAY) 
    FROM DateRange 
    WHERE Date < '2012-08-31'
),
TotalRevenue AS(
SELECT Daterange.Date, SUM(IF(b.memid = 0, f.guestcost, f.membercost)*b.slots) AS income,
	ROUND(AVG(SUM(
        CASE 
            WHEN b.memid = 0 THEN b.slots * f.guestcost 
            ELSE b.slots * f.membercost
        END)) OVER win, 2) as rol_avg
    FROM Daterange
    LEFT JOIN bookings AS b ON DATE(b.starttime) = Date
    LEFT JOIN facilities AS f ON b.facid = f.facid
    LEFT JOIN members AS m ON b.memid = m.memid
    GROUP BY Date
    WINDOW win as(
    ORDER BY Date ROWS BETWEEN 14 PRECEDING AND CURRENT ROW
    )
)
SELECT * FROM TotalRevenue
ORDER BY Date;