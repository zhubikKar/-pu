/*вывод даты последней регистрации члена клуба.*/
USE cd;

SELECT starttime FROM bookings
ORDER BY starttime DESC
LIMIT 1;