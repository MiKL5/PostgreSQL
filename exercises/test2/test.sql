SELECT COUNT(*) AS total FROM contact WHERE prenom='Ludivine';
SELECT SUM(1) AS somme FROM contact WHERE date_de_naissance::text LIKE '1983%';
SELECT COUNT(*) sexe , age FROM contact
	WHERE age BETWEEN 20 AND 45
	GROUP BY sexe , age
	HAVING COUNT(*) > 1
	ORDER BY age DESC;
SELECT COUNT(DISTINCT sexe) FROM contact;
SELECT * FROM contact WHERE age NOT BETWEEN 20 AND 27;
SELECT COUNT(*) , age , sexe FROM contact
	WHERE prenom LIKE '%a%' AND age BETWEEN 18 AND 40 AND sexe = 'M'
	GROUP BY age, sexe
	HAVING COUNT (*) > 1;
SELECT *,
	CASE
		WHEN age < 20
		THEN 'Vous avez la vie devant vous'
	END
FROM contact;