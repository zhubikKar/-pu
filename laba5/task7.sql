/*Найдите общее количество участников (члены + гости), 
совершивших хотя бы одно бронирование.*/
USE cd;
SELECT COUNT(DISTINCT b.memid) AS 'Кол-во участников'
FROM bookings AS b;