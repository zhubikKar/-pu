/*Выберите процент использования объектов по месяцам, упорядочив по возрастанию*/
USE cd;
SELECT monthname(starttime) as месяц, round(count(slots)/(SELECT count(*) FROM bookings)*100, 2) AS 'Использование объекта, %' 
FROM bookings
GROUP BY месяц;