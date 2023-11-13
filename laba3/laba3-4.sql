/*Выберите всех членов клуба и членов, которые их рекомендовали,  
отсортировав их по имени и фамилии.*/
USE cd;
SELECT * FROM members;
SELECT DISTINCT m1.memid, m1.surname, m1.firstname, m1.recommendedby, m2.surname, m2.firstname 
  FROM members AS m1 
    LEFT JOIN members AS m2 ON m2.memid = m1.recommendedby OR m2.recommendedby != 'null';
  WHERE m1.memid!= 0 ORDER BY m1.surname, m1.firstname;