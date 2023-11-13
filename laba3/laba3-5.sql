/*Выберите ФИО (== имя + фамилия) всех, кто покупал корты 1 и 2.*/
USE cd;
SELECT DISTINCT members.surname, members.firstname, facilities.facility
  FROM members
    JOIN facilities ON members.memid = facilities.facid
  WHERE  (facilities.facility = 'Tennis Court 1' OR facilities.facility = 'Tennis Court 2');