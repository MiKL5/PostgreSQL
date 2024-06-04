<a href="../"> <img src="https://upload.wikimedia.org/wikipedia/commons/2/29/Postgresql_elephant.svg" alt="PostgreSQL" title="PostgreSQL" align="right" height="64px"> </a><br>


1. Combier y a t-il de Ludivine ?
```sql
SELECT COUNT(DISTINCT(prenom='Ludivine') ) FROM contact;
SELECT COUNT(*) AS total FROM contact WHERE prenom='Ludivine';
```
2. Faire la somme des femmes nés en 1983.
```sql
SELECT SUM(1) AS somme FROM contact WHERE date_de_naissance::text LIKE '1983%';
```
3. Combien y a t-il de femmes entre 20 et 45 ans, dont le nnombre est supérieur à 1 en classant l’âge par ordre décroissant.
```sql
SELECT COUNT(*) sexe , age FROM contact
	WHERE age BETWEEN 20 AND 45
	GROUP BY sexe , age
	HAVING COUNT(*) > 1
	ORDER BY age DESC;
```
4. Quel est le nombre de ligne distinct dans la colonne sexe ?
```sql
SELECT COUNT(DISTINCT sexe) FROM contact;
```
5. Sélectionnr les personnes n’ayant pas de 20 à 27 ans.
```sql
SELECT * FROM contact WHERE age NOT BETWEEN 20 AND 27;
```
6. Combien de personne ayant la lettre A à leur prénom, entre 18 et 40 ans, masculines, dont le total est supérieur à 1 ?
```sql
SELECT COUNT(*) , age , sexe FROM contact
	WHERE prenom LIKE '%a%' AND age BETWEEN 18 AND 40 AND sexe = 'M'
	GROUP BY age, sexe
	HAVING COUNT (*) >1;
```
7. Construire une requête ayant pour résultat aux personnes de moins de 20 ans “Vous avez la vie devan vous.” `CASE ... WHEN ...`
```sql
SELECT *,
	CASE
		WHEN age < 20
		THEN 'Vous avez la vie devant vous'
	END
FROM contact;
```