/*Выведите список членов клуба, отформатированных как 'Surname, Firstname'*/
use cd;
SELECT CONCAT(Surname,', ',Firstname) AS ФИО FROM members;