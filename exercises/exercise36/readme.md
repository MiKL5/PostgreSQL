# **Création, modification et suporessuib d’une vue** <a href="../../"> <img src="https://upload.wikimedia.org/wikipedia/commons/2/29/Postgresql_elephant.svg" alt="PostgreSQL" title="PostgreSQL" align="right" height="64px"> </a>
> Définition :  
> Une vue est une table virtuelle.  
> C’est donc un objet créer sur le moteur. Cet objet sera appelé.  
> Le code qu’il contient sera exécuté.  
> Cela s’utilise comme une table.  
> Son but est de grandement facilité l’écriture des requêtes.  
> C’est très pratique quand il y a énormément de lignes.  
```sql
SELECT COUNT(*) total , sexe , date_de_naissance FROM contact
	WHERE date_de_naissance::text LIKE '%1976%' AND sexe LIKE 'M'
	GROUP BY sexe , date_de_naissance;
-- Créer une vue avec la requête ci-dessus
CREATE VIEW men1976
	AS
	SELECT COUNT(*) total , sexe , date_de_naissance FROM contact
	WHERE date_de_naissance::text LIKE '%1976%' AND sexe LIKE 'M'
	GROUP BY sexe , date_de_naissance;
-- Utiliser la vue
SELECT * FROM men1976;
-- N'afficher que le total
SELECT total FROM men1976;
-- Sebastien ne doit voir que les personne de moins de 30 ans. Créer la vue.
CREATE VIEW moinsDe30ans AS
	SELECT * FROM contact WHERE age < 30;
-- Afficher la vue
SELECT * FROM moinsDe30ans;
-- Créer pour voir les personnes de plus de 30 ans
CREATE VIEW plusDe30ans AS
	SELECT * FROM contact WHERE age > 30;
-- L'afficher
SELECT * FROM plusDe30ans;
-- Renomer une vue
ALTER VIEW men1976 RENAME TO hommes1976;
-- L'afficher
SELECT * FROM hommes1976;
-- La supprimer
DROP VIEW hommes1976;
```
Dans une vue, il est impossible de metre `INSERT`, `UPDATE` et `DELETE`.  
Avec PostgreSQL, il est impossible de modifier le code de la vue. Il faut la recréer.  