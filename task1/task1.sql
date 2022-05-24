INSERT INTO s (ks, sfn, sln, kt, gender, h, salary) VALUES
(111111, 'Dmitri', 'Savin', 3, 'm', 171, 10000.00),
(111112, 'Dmitri', 'Savin', 3, 'm', 171, 10000.00),
(111113, 'Alex', 'Shishkin', 2, 'm', 178, 8000.00),
(111114, 'Alex', 'Shishkin', 2, 'm', 178, 9000.00),
(111115, 'Grette', 'Tundberg', 1, 'f', 149, 3899.00),
(111116, 'Grette', 'Tundberg', 1, 'f', 160, 1800.00),
(111117, 'Gary', 'Oldman', 1, 'm', 160, 1800.00);



//Задача 1
SELECT ks, src.sfn, src.sln, src.kt, src.gender, src.h, src.salary
FROM s AS src
INNER JOIN 
	(SELECT sfn, sln, COUNT(*)
	FROM s
	GROUP BY sfn, sln
	HAVING COUNT(*) > 1)
	AS dupl
ON (src.sfn = dupl.sfn AND src.sln = dupl.sln)
ORDER BY ks, sfn, sln, kt, gender, h, salary;
