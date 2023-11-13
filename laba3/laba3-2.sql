/*Выберите теннисные корты, забронированные пользователями на 
19 сентября 2012 года.*/
USE cd;
SELECT facilities.facility, bookings.starttime  
  FROM facilities 
    JOIN bookings ON bookings.starttime LIKE '%2012-09-19%' 
  WHERE facilities.facility LIKE '%Tennis Court%';