/*Составьте список участников (включая гостей) вместе с количеством 
часов, которые они забронировали для объекта,  округленным до ближайших 
десяти часов. Ранжируйте их по этой округленной цифре, получая в результате 
имя, фамилию, округленные часы и звание (== ранг). Сортировка по званию 
(== рангу), фамилии и имени.*/
USE cd;
SELECT m.firstname AS 'Имя', m.surname AS 'Фамилия', ROUND(SUM(COALESCE(b.slots / 2, 0)) -1) AS 'Округлённые часы',
RANK() OVER (ORDER BY ROUND(SUM(COALESCE(b.slots / 2, 0)), -1)) AS Ранг
FROM members AS m
LEFT JOIN bookings AS b ON m.memid = b.memid
GROUP BY m.memid
ORDER BY Ранг, m.surname, m.firstname;