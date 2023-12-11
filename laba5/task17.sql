/*Классифицируйте объекты на группы одинакового размера 
(высокие, средние и низкие в зависимости от их доходов). 
Упорядочите по классификации и названию объекта.
Примечание: используйте функцию деления на группы ntile.*/
USE cd;
WITH IncomeGroups AS (
    SELECT 
        f.facility,
        SUM(b.slots) AS Total_Income,
        NTILE(3) OVER (ORDER BY SUM(b.slots)) AS Income_Group
    FROM bookings AS b
    INNER JOIN facilities AS f ON b.facid = f.facid
    GROUP BY f.facility
)
SELECT 
    facility AS 'Название объекта',
    CASE 
        WHEN Income_Group = 1 THEN 'высокий'
        WHEN Income_Group = 2 THEN 'средний'
        ELSE 'низкий' 
    END AS Income_Category
FROM IncomeGroups
ORDER BY Income_Group, facility;