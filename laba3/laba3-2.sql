/*Выберите теннисные корты, забронированные пользователями на 
19 сентября 2012 года.*/
USE cd;
SELECT facilities.facid, facilities.facility, bookings.facid, bookings.starttime FROM facilities 
JOIN bookings
ON EXTRACT(DAY FROM starttime) = 19 AND EXTRACT(MONTH FROM starttime) = 9 
AND EXTRACT(YEAR FROM starttime) = 2012 AND facility LIKE '%Tennis Court%';