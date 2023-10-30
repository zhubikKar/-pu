/*Выберите ФИО (== имя + фамилия) всех, кто покупал корты 1 и 2.*/
USE cd;
SELECT members.memid, facilities.facid, members.surname, members.firstname, facilities.facility
FROM members
JOIN facilities ON (facilities.facility = 'Tennis Court 1' OR facilities.facility = 'Tennis Court 2' ) AND members.memid = facilities.facid;