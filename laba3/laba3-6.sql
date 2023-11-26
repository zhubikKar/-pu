/* Выберите список бронирований на 14 сентября 2012 г., чтоимость 
которых более 30. Включите в выходные данные название заведения, имя 
участника, отформатированное как одиночное столбец и стоимость. 
Упорядочивайте по убыванию стоимости и не используйте подзапросы.
Помните, что у гостей разные затраты по сравнению с участниками 
(указанные затраты указаны за получасовой «интервал»), а идентификатор 
гостя всегда имеет идентификатор 0.*/
USE cd;
SELECT DISTINCT CONCAT(f.facility, ' - ', m.firstname) AS facilityName, 
CASE
WHEN b.memid = 0 THEN f.guestcost * b.slots
ELSE f.membercost * b.slots 
END AS cost
FROM bookings b
JOIN facilities f ON b.facid = f.facid
JOIN members m ON b.memid = m.memid
WHERE DATE(b.starttime) = '2012-09-14' AND
((b.memid = 0 AND  f.guestcost * b.slots > 30) OR
(b.memid != 0 AND f.membercost * b.slots > 30)) 
ORDER BY cost DESC;