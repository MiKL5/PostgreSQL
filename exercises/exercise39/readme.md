# **Les déclencheurs**  <a href="../../"> <img src="https://upload.wikimedia.org/wikipedia/commons/2/29/Postgresql_elephant.svg" alt="PostgreSQL" title="PostgreSQL" align="right" height="64px"> </a>
Avec PostgreSQL est trigger (déclacheur) est une fonction invoquée automatiquement chaque fois qu’un événement associé à une table se produit.  
Un événement avoir lieu à la suite d’un ’`SELECT`’, d’un ’`UPDATE`’, d’un ’`DELETE`’ ou d’un ’`TRUNCATE`’.  

Cette fonction spéciale asociée à une table est définie par l’utilisateur.  

Pour en créer un, il faut définir une fonction de déclancheur et la liée à une table.  
Cela commence par ’`CREATE FUNCTION`’.  
Puis, la lier au déclancheur.  
<!-- 
Donc avec PostgreSQL un déclencheur est toujours en corélation avec une fonction.  
Alors qu'avec SQL Server le déclencheur est indépendant. -->
```sql
-- Créer une table pour les employés
CREATE TABLE IF NOT EXISTS employees(
	id SERIAL PRIMARY KEY ,
	first_name VARCHAR(40) NOT NULL ,
	last_name VARCHAR(40) NOT NULL
);

--Créer une table des audits des employés (avec une colonne en date)
CREATE TABLE IF NOT EXISTS employees_audits (
	id SERIAL PRIMARY KEY ,
	employes_id INT NOT NULL ,
	last_name VARCHAR(40) NOT NULL ,
	changed_on TIMESTAMP(6) NOT NULL
);

-- Créer la function
CREATE OR REPLACE FUNCTION log_last_name_changes() RETURNS TRIGGER AS $emp_stamp$
	BEGIN
	IF NEW.last_name <> OLD.last_name THEN -- Si l'attribut est différent
		INSERT INTO employes_audits(employees_id , last_name , changed_on) -- Insertion dans employes_audits
		VALUES(OLD.id , OLD.last_name , nom() ); -- Ancienne valeurs (id , last_name , date)
	END IF;
		RETURN NEW;
	END;
$emp_stamp$ LANGUAGE plpgsql; -- Procédural PostgreSQL

-- Créer le déclancheur
CREATE TRIGGER last_name_changes
	BEFORE UPDATE -- av. la màj
	ON employees -- la table
	FOR EACH ROW -- À chaque ligne
	EXECUTE PROCEDURE log_last_name_changes(); -- Exécute la function

-- Insérer deux valeurs
INSERT INTO employees (first_name , last_name)
	VALUES ('John' , 'DOE');

INSERT INTO employees (first_name , last_name)
	VALUES ('Lily' , 'BROWN');

-- Lily s'est mariée est s'appelle BUSHSE
UPDATE employees
	SET last_name = 'BUSHSE'
	WHERE id = 2;

-- Vérifier que les données sont dans la table audit
SELECT * FROM employees_audits;
```
Ne pas appeler trop de déclancheurs pour les performances.