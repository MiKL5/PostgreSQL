# **La contrainte `UNIQUE` et `CHECK`**  <a href="../../"> <img src="https://upload.wikimedia.org/wikipedia/commons/2/29/Postgresql_elephant.svg" alt="PostgreSQL" title="PostgreSQL" align="right" height="64px"> </a>
## **La contrainte `CHECK`**
```sql
-- Créer une table classique
CREATE TABLE IF NOT EXISTS personne(
	Nom VARCHAR(255) NOT NULL,
	Prenom VARCHAR(255),
	Age INT,
	CHECK (Age < 5) /* la contrainte CHECK, vérifie que l'âge est inférieur à 5 */
);
-- Ajouter Olivier Thuillier âgé de 4 ans
INSERT INTO personne VALUES('Thuillier' , 'Olivier' , 4);
-- Est-il dans la table ?
SELECT * FROM personne;
-- Ajouter une personne de 5 ans et observer ce qu'il ce passe
INSERT INTO personne VALUES('Hikaru' , 'Utada' , 5); -- ERROR:  La ligne en échec contient (Chuillier, Lucas, 29).la nouvelle ligne de la relation « personne » viole la contrainte de vérification « personne_age_check »
-- Ajouter une personne à l'âge incunu et vérifier
INSERT INTO personne VALUES('Virenque' , 'Virginie' , NULL); -- Elle est ajoutée
-- Supprimer la contrainte et vérifier
ALTER TABLE personne DROP CONSTRAINT personne_age_check; -- La contrainte est supprimée

-- Créer une table à deux contraintes d'âge
CREATE TABLE IF NOT EXISTS personne2(
	Nom VARCHAR(255) NOT NULL,
	Prenom VARCHAR(255),
	Age INT,
	CHECK (Age < 5),
	CHECK (Age > 0)
); -- Dexu contraintes sont crées
-- Ajouter une personne de moins de 0 ans
INSERT INTO personne2 VALUES('Hikaru' , 'Utada' , -5); -- impossible

-- Créer une table avec deux contraintes de nom
CREATE TABLE IF NOT EXISTS valeur_donne (valeur VARCHAR(200) , CHECK(valeur IN('TITI' , 'TOTO') ) );
-- Ajouter TATA
INSERT INTO valeur_donne VALUES('tata'); -- impossible
-- Ajouter toto
INSERT INTO valeur_donne VALUES('toto'); -- impossible
-- Ajouter TOTOT
INSERT INTO valeur_donne VALUES('TOTO'); -- Ajouté

-- Créer une table ayant des contraintes à plusieurs attributs
CREATE TABLE IF NOT EXISTS personne3(
	nom VARCHAR(255) NOT NULL,
	prenom VARCHAR(255),
	age INT,
	CHECK(Age BETWEEN 5 and 10 and nom = 'Thuillier')
);
-- Ajouter Mary Thuillier2
INSERT INTO personne3 VALUES('Thuillier2' , 'Mary' , 5); -- Ingterdit
-- Ajouter Mary Thuillier
INSERT INTO personne3 VALUES('Thuillier' , 'Mary' , 5);
-- Ajouter Olivier Thuillier d'11 ans
INSERT INTO personne3 VALUES('Thuillier' , 'Olivier' , 11);
-- Ajouter Axel Thuillier de 10 ans
INSERT INTO personne3 VALUES('Thuillier' , 'Axel' , 10);
```
<!-- ```sql
-- Ajouter une personne à l'a^ge négatif
INSERT INTO personne VALUES('Hikaru' , 'Utada' , -5); -- Un âge inférieur à 0 passe
``` -->
## **La clé Unique**
Elle refuse les doublons et accepte les entrées vides.  
La contrainte `UNIUQUE` peut-être à plusieurs colonnes.  
Elle ne crée pas d’index non cluster par défaut, contrairement à SQL Server.

Quant à la contrainte `DEFAULT` elle comble un vide, mais n’interdit pas une info.
```sql
-- Créer une table avec la clé `UNIQUE` au nom
CREATE TABLE IF NOT EXISTS table_unique(nom VARCHAR(200) NULL UNIQUE , prenom VARCHAR(200) );
-- Ajouter Bruno Thuillier
INSERT INTO table_unique VALUES ('Thuillier' , 'Bruno');
-- Ajouter Olivier Thuillier
INSERT INTO table_unique VALUES ('Thuillier' , 'Olivier'); -- ERROR:  La clé « (nom)=(Thuillier) » existe déjà.la valeur d'une clé dupliquée rompt la contrainte unique « table_unique_nom_key » 
-- Ajouter Caroline son nom est inconnu
INSERT INTO table_unique VALUES (NULL , 'Caroline');

-- Créer une table avec les contrainteS `UNIUQE` et `DEFAULT`
CREATE TABLE IF NOT EXISTS unique_default (
	nom VARCHAR(255) NULL UNIQUE,
	prenom VARCHAR(200) DEFAULT 'TOTO'
);
-- Ajouter Monsieur Oliver dont le prénom est par défault
INSERT INTO unique_default VALUES ('Oliver' , DEFAULT);
-- INsérer Olivier Bruno
INSERT INTO unique_default VALUES ('Olivier' , 'Bruno'); -- Porte bien le prénom 'Bruno'

-- Créer une table sont les deux colonnes ont la contrainte `UNIQUE`
CREATE TABLE IF NOT EXISTS t_unique (
	nom VARCHAR(255) NULL UNIQUE,
	prenom VARCHAR(255) UNIQUE
);
```