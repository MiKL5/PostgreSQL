# **La [cascade d’intégrité référentielle](define)**  <a href="../../"> <img src="https://upload.wikimedia.org/wikipedia/commons/2/29/Postgresql_elephant.svg" alt="PostgreSQL" title="PostgreSQL" align="right" height="64px"> </a>
Elle permet des mise à jour et suppression en cascade.
```sql
-- Créer deux tables d'intégrité en cascade
CREATE TABLE IF NOT EXISTS oncascade
(
	ID INT PRIMARY KEY,
	nom VARCHAR(255) NOT NULL,
	prenom VARCHAR(255)
);
CREATE TABLE IF NOT EXISTS oncascade2
(
	ID INT PRIMARY KEY,
	nom VARCHAR(255) NOT NULL,
	prenom VARCHAR(255)
);

-- Insérer aux deux tables un ligne
INSERT INTO oncascade VALUES (1 , 'VALORTA' , 'ZENO');
INSERT INTO oncascade2 VALUES (1 , 'VALORTA' , 'ZENO');

-- Ajouter une foreign key à 'oncascade'
ALTER TABLE oncascade2 ADD CONSTRAINT oncascade2 FOREIGN KEY (ID) REFERENCES oncascade(ID);

-- Supprimer l'ID 1 à 'oncascade'
DELETE FROM oncascade WHERE ID = 1; -- ERROR:  La clé (id)=(1) est toujours référencée à partir de la table « oncascade2 ».UPDATE ou DELETE sur la table « oncascade » viole la contrainte de clé étrangère « oncascade2 » de la table « oncascade2 »

-- Mettre à jour l'id 1 en id 2
UPDATE oncascade SET ID = 2; -- ERROR:  La clé (id)=(1) est toujours référencée à partir de la table « oncascade2 ».UPDATE ou DELETE sur la table « oncascade » viole la contrainte de clé étrangère « oncascade2 » de la table « oncascade2 »

-- Supprimer la containte avec 'oncascade2'
ALTER TABLE oncascade2 DROP CONSTRAINT oncascade2;

-- Ajouter une FK avec `DELETE cascade`
ALTER TABLE oncascade2 ADD CONSTRAINT oncascade2 FOREIGN KEY (ID) REFERENCES oncascade(ID) ON DELETE CASCADE; -- fait la FK aprés une instruction `ON DELETE`, et applicable à la première, puis à la seconde table. 

-- Sauvegarder une transaction ouverte
BEGIN TRANSACTION;

-- Supprimer l'ID + 1
DELETE FROM oncascade WHERE ID = 1;

-- Si vous n'êtes pas d'accord
ROLLBACK;
-- Si vous êtes d'accord
COMMIT; -- Le rollback n'est plus possible et la transaction est finie

-- Mettre à jour en ID = 2 via `UPDATE`
UPDATE oncascade SET ID = 2; -- ERROR:  La clé (id)=(1) est toujours référencée à partir de la table « oncascade2 ».UPDATE ou DELETE sur la table « oncascade » viole la contrainte de clé étrangère « oncascade2 » de la table « oncascade2 »

-- Retirer la contrainte
ALTER TABLE oncascade2 DROP CONSTRAINT oncascade2;

-- vider les tables
TRUNCATE TABLE oncascade , oncascade2;
-- SOnt elles vides
SELECT * FROM oncascade , oncascade2; -- Evidement

-- Ajouter la contrainte `UPDATE` et `DELETE`
INSERT INTO oncascade , oncascade2 VALUES (1 , 'VALORTA' , 'ZENO'); -- Agir sur les deux tables si il y a une mise à jour ou une suppression en cascade

-- Faire une mise à jour en ID = 2 et s'assurer qu'il est en cascade
UPDATE oncascade SET ID = 2; -- correcte

-- Supprimer 'oncascade'
DROP TABLE oncascade; -- impossible, il y a un sens

-- Supprimer en respectant le sens
DROP TABLE oncascade2;
DROP TABLE oncascade;
```
___
> `BEGIN TRANSACTION` avec `ROLLBACK` et `COMMIT` sont possibles avec SQL Server et Oracle SQL.