/*Составьте список имен и идентификаторов каждого участника, 
а также их первого бронирования после 1 сентября 2012 г. 
Упорядочите по идентификатору участника.*/
USE cd;
SELECT m.memid AS 'ID участника', m.firstname AS 'Имя участника', m.surname AS 'Фамилия участника', 
MIN(b.starttime) AS 'Первое бронирование после 1 сентября 2012 года'
FROM members AS m
INNER JOIN bookings AS b ON m.memid = b.memid
WHERE b.starttime >= '2012-09-01' AND m.memid != 0
GROUP BY m.memid, m.firstname, m.surname
ORDER BY m.memid;