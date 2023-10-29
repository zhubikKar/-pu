/* Выберите имя, фамилию и дату вступления в клуб последних из 
всех вступивших.*/
USE cd;
SELECT m.firstname, m.surname, b.starttime 
FROM members AS m JOIN bookings AS b
ON m.memid = b.memid ORDER BY b.starttime DESC;