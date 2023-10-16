/*вывод всех членов клуба, зарегистрированных 
с сентября 2012 года.*/
SELECT * FROM cd.bookings
WHERE starttime LIKE '%2012-09%';