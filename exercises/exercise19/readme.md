# **L’opération `UPSERT`** <a href="../../"> <img src="https://upload.wikimedia.org/wikipedia/commons/2/29/Postgresql_elephant.svg" alt="PostgreSQL" title="PostgreSQL" align="right" height="64px"> </a>
Cette oprération permet à l’insertion d’une nouvelle ligne de la meetre à jour s’il elle existe.  
Autremeent, PostgreSQL, l’insère.  
D’où l’appelation ’`UPSERT`’.<!--  C'est la contraction d'update et insert. -->
```sql
--Créer une table
CREATE TABLE customers (
	customer_id serial PRIMARY KEY ,
	name VARCHAR UNIQUE ,
	email VARCHAR NOT NULL ,
	active BOOL NOT NULL DEFAULT TRUE
);
-- Renseigner la table
INSERT INTO customers (name , email) 
	VALUES
	('IBM' , 'contact@ibm.com'),
	('Microsoft' , 'contact@microsoft.com'),
	('Intel' , 'contact@intel.com');
-- insérer une ligne et en rien faire si conflict
INSERT INTO customers (name , email)
	VALUES ('Microsoft' , 'hotline@microsoft.com')
	ON CONFLICT ON CONSTRAINT customers_name_key -- s'il y a une conflit de contrainte ne rien faire
	DO NOTHING; -- il n'y a pas eu d'upsert pour Microsoft
-- insérer avec une update en cazs de conflit
INSERT INTO customers (name , email)
	VALUES ('Microsoft' , 'hotline@microsoft.com')
	ON CONFLICT (name)
	DO UPDATE
	SET email = EXCLUDED.email; -- l'upsert a eu lieu pour l'e-mail
-- insérer, mais en cas de conflit concaténer
INSERT INTO customers (name , email)
	VALUES ('Microsoft' , 'contact@microsoft.com')
	ON CONFLICT (name)
	DO UPDATE
	SET email = EXCLUDED.email || ';' || customers.email; -- il y a eu une concaténation juste avant l'ancienne -- ne pas omettre le point virgule entre côtes
```