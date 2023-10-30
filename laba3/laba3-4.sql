/*Выберите всех членов клуба и членов, которые их рекомендовали,  
отсортировав их по имени и фамилии.*/
USE cd;
SELECT * FROM members;
SELECT DISTINCT m.memid, m.surname, m.firstname, m.recommendedby FROM members AS m 
JOIN members AS m2 ON m.memid = m2.recommendedby OR m2.recommendedby != 'null';
SELECT DISTINCT memid, surname, firstname, recommendedby FROM members 
WHERE memid!= 0 ORDER BY surname, firstname;