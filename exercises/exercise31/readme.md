Les fonctions de partitionnement `OVER` et `PARTITION BY` <a href="../../"> <img src="https://upload.wikimedia.org/wikipedia/commons/2/29/Postgresql_elephant.svg" alt="PostgreSQL" title="PostgreSQL" align="right" height="64px"> </a>
Les fonctions de fenêtrage aussi appeler fonctions de partitionneemnts sont une famille d’outils extrêment puissant en Transct-SQL.  
Elles permettent de faire face à des situations ou des curseurs et des sous requêtes seraient nécessaires.  

Une fonction de fenêtrage fonctionne sur un ensemble d’enregistrements ayant toujours la clause `OVER`.  
Cette clause définit soit une fenêtre, soit un ensemble spécifié par l’utilisateur dans un jeu de résultat de requête.  
Les fonctions de fenêtrage apparaissent toujours dans `SELECT` ET `ORDER BY`.
Et n’apparaissent pas dans `FROM`, `WHERE`, `GROUP BY`, `HAVING`.  
Les fonctions de partitionnement contiennent forcément `ORDER BY`.
```sql
-- Numéroté les enregistrements par un `ORDER BY`
SELECT * ,
	ROW_NUMBER () OVER (ORDER BY age) AS rownumber -- compte et numéote les lignes sur et par l'ordre ascendant des âges
	FROM contact;
-- idem en order descendant
SELECT * ,
	ROW_NUMBER () OVER (ORDER BY age DESC) AS rownumber
	FROM contact;
-- Ajoutr `PARTITION BY` pour compter le nombre de personne de même âge
SELECT * ,
	ROW_NUMBER () OVER (PARTITION BY age ORDER BY age) AS rownumber
	FROM contact;
-- Le faire par âge et date de naissance
SELECT * ,
	ROW_NUMBER () OVER (PARTITION BY age , date_de_naissance ORDER BY age) AS rownumber -- la numérotation conscidère les deux
	FROM contact; -- Ca peut aller très loin
```