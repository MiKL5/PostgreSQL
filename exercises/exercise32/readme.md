Les fonctions de partitionnement `NTILE/RANK` et `DENSE RANK` <a href="../../"> <img src="https://upload.wikimedia.org/wikipedia/commons/2/29/Postgresql_elephant.svg" alt="PostgreSQL" title="PostgreSQL" align="right" height="64px"> </a>
La fonction RANK() est similaire à ROW_NUMBER(), la syntaxe est la même
```sql
-- utiliser 'ROW_NUMBER()' et 'RANK()' et `DENSE_RANK()`
SELECT c,
	ROW_NUMBER() OVER(ORDER BY c), -- il y a une incrémentation à chaque ligne
	RANK() OVER(ORDER BY c) rank_number, -- attribut le numéro de la première ligne à chaque différence
	DENSE_RANK() OVER(ORDER BY c) dense_number -- il y a incrémentation  à chaque différence, elle ne saute pas de ligne
	FROM ranks;
-- ajouter `NTILE()`
SELECT c,
	ROW_NUMBER() OVER(ORDER BY c),
	RANK() OVER(ORDER BY c) rank_number,
	DENSE_RANK() OVER(ORDER BY c) dense_number,
	NTILE(4) OVER(ORDER BY c) ntiles -- Il yy a l'incrémentation d'un à chaque différence comme `DENSE_NUMBER()`
	FROM ranks;
-- Utiliser NTILE() et fragmenter la numérotation en 4
SELECT * ,
	NTILE(4) OVER(ORDER BY price) ntiles -- du moins au plus cher `NTILE()` morcele/divise la requête
	FROM product;
```