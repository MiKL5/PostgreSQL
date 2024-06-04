# **Les commandes `UNION`, `UNION ALL`, `IF/ELSE`** <a href="../../"> <img src="https://upload.wikimedia.org/wikipedia/commons/2/29/Postgresql_elephant.svg" alt="PostgreSQL" title="PostgreSQL" align="right" height="64px"> </a>
## **Les Unions**
`UNION` est une ancienne syntaxe permettant de concaténer les résultats de plusieurs requêtes.  
À condition que les deux sélections aient les même nombre de colonnes.  
```sql
-- Créer deux tables
CREATE TABLE client_1 (nom VARCHAR(20) , prenom VARCHAR(20) , age INT);
INSERT INTO client_1
	VALUES ('Marchand' , 'Elisabeth' , '18'), ('Truchon' , 'Melanie' , '18');
CREATE TABLE client_2 (nom VARCHAR(20) , prenom VARCHAR(20) , age INT);
INSERT INTO client_2
	VALUES ('Marchand' , 'Elisabeth' , '18') , ('Thuilier' , 'Olivier' , '18');
-- Unir les tables avec `UNION`
SELECT * FROM client_1
	UNION
	SELECT * FROM client_2; -- pas de doublon
-- Unir les doublons avec `UNION ALL` pour garder les doublons
SELECT * FROM client_1
	UNION ALL
	SELECT * FROM client_2;
```
## **L’instruction `IF THEN ELESE`**
Exécute une commande que lorsque la condition est vraie.
Puis, exécute une commande alternative lorsque la condition est fausse
```sql
DO $$
DECLARE
	a INTEGER :=10;
	b INTEGER :=20;
BEGIN
	IF a > b THEN
		RAISE NOTICE 'a is greater than b';
	ELSE
		RAISE NOTICE 'a is not graater than b';
	END IF;
END $$;
```
<!-- ___
>>>NOTA  
`$$` et une ancienne syntaxe pouvant être ce que je veux avec PostgreSQL -->