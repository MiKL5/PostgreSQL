# **Les fonctions `OVERLAPS` and Generale_Series** <a href="../../"> <img src="https://upload.wikimedia.org/wikipedia/commons/2/29/Postgresql_elephant.svg" alt="PostgreSQL" title="PostgreSQL" align="right" height="64px"> </a>
## **La fonction `OVERLAPS` ➜ chevauchement**
```sql
-- Est-ce que ces dates se chevauchent
SELECT ('2019-02-10'::DATE , '2019-02-14'::DATE)
	OVERLAPS ('2019-02-14'::DATE , '2019-02-18'::DATE); -- false

SELECT ('2019-02-10'::DATE , '2019-09-14'::DATE)
	OVERLAPS ('2019-02-14'::DATE , '2019-02-18'::DATE); -- true
```
## **La fonction ‘Generate_Series’**
Elle génère des séries à la volée.
```sql
SELECT * FROM generate_series(2 , 4); -- génère 2,3,4

-- Dans l'ordre descendant, de 2 en 2
SELECT * FROM generate_series(5 , 1, -2); -- génère 5,3,1
-- idem avec 3.5
SELECT * FROM generate_series(22 , 0, -3.5);
-- générer des nombres négatifs
SELECT * FROM generate_series(22 , -6, -3.5);

-- Générer des dates
-- Dans ce cas avec 1 heure de décalage
SELECT * FROM generate_series('2019-10-10'::TIMESTAMP , '2019-10-11'::TIMESTAMP , '1 hour');
-- Maintenant avec 1 minute
SELECT * FROM generate_series('2019-10-10'::TIMESTAMP , '2019-10-11'::TIMESTAMP , '1 minute');
-- 5 minutes
SELECT * FROM generate_series('2019-10-10'::TIMESTAMP , '2019-10-11'::TIMESTAMP , '5 minutes');
```