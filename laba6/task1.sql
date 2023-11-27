/*Выберите начальное и конечное время последних 10 аренд 
объектов, упорядочив их по времени их окончания.*/
USE cd;

SELECT bookid, facid, starttime AS начало, 
ADDTIME(starttime, sec_to_time(slots*1800)) AS конец 
FROM bookings ORDER BY конец DESC LIMIT 10;