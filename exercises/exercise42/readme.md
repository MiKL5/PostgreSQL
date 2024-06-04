# **La contrainte `PRIMARY KEY`**  <a href="../../"> <img src="https://upload.wikimedia.org/wikipedia/commons/2/29/Postgresql_elephant.svg" alt="PostgreSQL" title="PostgreSQL" align="right" height="64px"> </a>
La Clé primaire n’accepte ni les doublons, ni les `NULL`.  
Une table ne peut en contenir qu’une.  
Il est préférable d’en avoir une à chaque table.
```sql
-- Créer une table ayant une clé primaire
CREATE TABLE IF NOT EXISTS primary_key
(
	nom VARCHAR(255) PRIMARY KEY,
	personne VARCHAR(255)
);
-- Insérer une valeur `NULL` comme PK
INSERT INTO primary_key VALUES (NULL , 'Karina'); -- ERROR:  La ligne en échec contient (null, Karina).une valeur NULL viole la contrainte NOT NULL de la colonne « nom » dans la relation « primary_key » 
-- Insérer 2 fois Karina Thuillier
INSERT INTO primary_key VALUES ('Thuillier' , 'Karina');
INSERT INTO primary_key VALUES ('Thuillier' , 'Karina'); -- ERROR:  La clé « (nom)=(Thuillier) » existe déjà.la valeur d'une clé dupliquée rompt la contrainte unique « primary_key_pkey » 

-- Ajouter une seconde PK
ALTER TABLE IF EXISTS primary_key ADD PRIMARY KEY (personne); -- ERROR:  les clés primaires multiples ne sont pas autorisées pour la table « primary_key »

-- Supprimer la table et recréer là avec une contrainte `UNIQUE`
DROP TABLE IF EXISTS primary_key;
CREATE TABLE IF NOT EXISTS primary_key
(
	nom VARCHAR(255) UNIQUE PRIMARY KEY,
	personne VARCHAR(255)
);

-- Créer une Table avec la contrainte UNIQUE à la PK
CREATE TABLE IF NOT EXISTS primary_key
(
	nom VARCHAR(255) UNIQUE PRIMARY KEY,
	personne VARCHAR(255)
);

-- Créer une able avec un CHECK à la PK
CREATE TABLE IF NOT EXISTS primary_key2
(
	nom VARCHAR(255) PRIMARY KEY CHECK (nom IN ('Thuillier')),
	personne VARCHAR(255)
);
-- Ajouter Julia Olivier
INSERT INTO primary_key2 VALUES ('Olivier' , 'Julia'); -- ERROR:  La ligne en échec contient (Olivier, Julia).la nouvelle ligne de la relation « primary_key2 » viole la contrainte de vérification « primary_key2_nom_check »
CREATE TABLE IF NOT EXISTS primary_key3
(
	idantifiant VARCHAR(255) PRIMARY KEY DEFAULT '1'
);
-- Ajouter la valeur par devaut
INSERT INTO primary_key3 VALUES (DEFAULT);
-- Ajouter l'id 1
INSERT INTO primary_key3 VALUES (1); -- ERROR:  La clé « (idantifiant)=(1) » existe déjà.la valeur d'une clé dupliquée rompt la contrainte unique « primary_key3_pkey »
-- Combien y a t-il d'enregistrement ?
SELECT * FROM primary_key3; -- 1
```