/* вывод объектов, пользование которых платно, 
но стоимость использования не превышает 1/50 от 
стоимости месячного обслуживания */
SELECT * FROM cd.facilities
WHERE membercost > 0 AND membercost <= monthlymaintenance/50;