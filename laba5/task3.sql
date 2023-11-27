/*Рассчитайте для каждого члена количество рекомендаций, данных этим 
членом клуба, искючив членов, которые не давали рекомендаций.*/
USE cd;
SELECT CONCAT(m.firstname, ' ', m.surname) AS 'ФИО', COUNT(m.memid) AS 'Кол-во рекомендаций'
FROM members AS m
JOIN members AS m1 ON m1.recommendedby = m.memid
GROUP BY m.memid;