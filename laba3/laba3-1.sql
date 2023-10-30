/*Выберите лист времке  (timestamp) покупки времени 
использования объектов членом клуба 'David Farrell'.*/
USE cd;
SELECT members.memid, bookings.memid, members.surname, members.firstname, bookings.starttime 
FROM members
JOIN bookings ON (surname = 'FARRELL' AND firstname = 'DAVID') AND members.memid = bookings.memid;
