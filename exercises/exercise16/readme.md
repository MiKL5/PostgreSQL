# **La condition `HAVING`** <a href="../../"> <img src="https://upload.wikimedia.org/wikipedia/commons/2/29/Postgresql_elephant.svg" alt="PostgreSQL" title="PostgreSQL" align="right" height="64px"> </a>
Comme une cousin de ’`WHERE`’, car elle y est presque similaire.  
Sa différence est de filtrer avec des fonctions telles que ’`SUM()`’.
<!-- `GROUP BY` est toujours après `WHERE` et `GROUP BY` toujours après `GROUP BY`. -->
<!-- `HAVING` est comme `WHERE` avec l'agrégat en plus. -->
```sql
-- Compter le nombre de personnne masculine de 20 à 25 ans.
SELECT COUNT(*) AS total , sexe , age FROM contact
	WHERE sexe = 'M' AND age BETWEEN 20 AND 25
	GROUP BY  sexe , age;
-- Faire un total supérieur à 2
SELECT COUNT(*) AS total , sexe , age FROM contact
	WHERE sexe = 'M' AND age BETWEEN 20 AND 25
	GROUP BY  sexe , age
	HAVING COUNT (*) > 2;
-- Idem avec SUM()
SELECT COUNT(*) AS total , sexe , age FROM contact
	WHERE sexe = 'M' AND age BETWEEN 20 AND 25
	GROUP BY  sexe , age
	HAVING SUM(1) > 2; -- même résultat
```