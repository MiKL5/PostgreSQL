# **La contrainte [`FOREIGN KEY`](define)**  <a href="../../"> <img src="https://upload.wikimedia.org/wikipedia/commons/2/29/Postgresql_elephant.svg" alt="PostgreSQL" title="PostgreSQL" align="right" height="64px"> </a>
Il s’agit d’une clé étrangère.  
Elle garantie l’intégrité référentielle entre deux tables.  
Elle est étroitement liée à la PK.  
C’est une relatin Parent / enfant.  
La PK est reliée à sont enfant FK, dans les deux sens.  
Cette relatio ne peut pas être trompée.  
Elle sont liées ensemble par l’existance de ces objets.

S’il y a besoin de passer au-delà des contraintes il faut utiliser un `TRIGGER` ➜ `DISABLE TRIGGER ALL`;

Il faut d’abord supprimer la table enfant pour supprimer la table parent.
```sql
-- Créer les tables parent et enfant avec chacine un enregistrement
CREATE TABLE IF NOT EXISTS parent
(
	nom VARCHAR(255) PRIMARY KEY,
	prenom VARCHAR(255)
);
INSERT INTO parent VALUES ('SANTAROSSA' , 'ZENO');

CREATE TABLE IF NOT EXISTS enfant
(
	nom VARCHAR(255),
	adresse VARCHAR(255),
	FOREIGN KEY (nom) REFERENCES parent(nom)
);
INSERT INTO enfant VALUES ('SANTAROSSA' , '2 Rue du bout des près'); -- Relation du contrainte d'ingégrité aux deux tables

-- Que se passe t-il si l'intégrité n'est pas respectée ?
INSERT INTO enfant VALUES ('SANTAROSSA' , '2 Rue du bout des près'); -- ERROR:  La clé (nom)=(SANTAROSSI) n'est pas présente dans la table « parent ».une instruction insert ou update sur la table « enfant » viole la contrainte de clé étrangère « enfant_nom_fkey » - Détail : La clé (nom)=(SANTAROSSI) n'est pas présente dans la table « parent ».

-- Afficher les deux tables
SELECT parent.nom , parent.prenom , enfant.adresse FROM parent , enfant; -- Zeno est lié par les PK et FK

-- Modifier le nom à la table parent et observer ce qu'il se passe
UPDATE parent SET nom = 'ROSSI' WHERE nom = 'SANTAROSSA'; -- Il y a violation de contrainte
-- Idem avec la table enfant
UPDATE enfant SET nom = 'ROSSI' WHERE nom = 'SANTAROSSA'; -- Même violation

-- Il faut désactiver la FK
ALTER TABLE IF EXISTS enfant DISABLE TRIGGER ALL;
-- Modifier le nom par SANTAROSSI à la table enfant puis à la table parent et vérifier
UPDATE enfant SET nom = 'SANTAROSSI' WHERE nom = 'SANTAROSSA';
UPDATE parent SET nom = 'SANTAROSSI' WHERE nom = 'SANTAROSSA';
SELECT parent.nom , parent.prenom , enfant.adresse FROM parent, enfant; -- Il s'appel SANTAROSSI

-- Réactiver la contrainte FK
ALTER TABLE IF EXISTS enfant ENABLE TRIGGER ALL;
-- Changer le nom aux deux tables
UPDATE enfant SET nom = 'SANTAROSSA' WHERE nom = 'SANTAROSSI'; -- Violations
UPDATE parent SET nom = 'SANTAROSSA' WHERE nom = 'SANTAROSSI'; -- idems

-- Supprimer la table parent en premier
DROP TABLE IF EXISTS parent; -- ERROR:  contrainte enfant_nom_fkey sur table enfant dépend de table parentn'a pas pu supprimer table parent car d'autres objets en dépendent 

-- Supprimer les tables enfant puis parent
DROP TABLE IF EXISTS enfant; -- fonctionne 
DROP TABLE IF EXISTS parent; -- fonctione
```