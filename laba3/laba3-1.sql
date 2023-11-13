/*Выберите лист времке  (timestamp) покупки времени 
использования объектов членом клуба 'David Farrell'.*/

USE cd;
SELECT bookings.starttime 
  FROM members
    JOIN bookings ON members.memid = bookings.memid
  WHERE (members.surname = 'FARRELL' AND members.firstname = 'DAVID') ;
