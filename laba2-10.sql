/*вывод 10 фамилий членов клуба, 
упорядоченных по алфавиту без повторов*/
SELECT DISTINCT surname FROM cd.members 
ORDER BY surname LIMIT 10;
