/* вывод всех членов клуба, зарегистрированных 
с сентября 2012 года.*/
USE cd;

SELECT memid, surname, firstname FROM members 
WHERE EXTRACT(MONTH FROM joindate) >= 9 AND EXTRACT(YEAR FROM joindate) >= 2012;