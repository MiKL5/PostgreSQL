# **Les fonctions d’agrégat `COUNT`, `SUM`, `GROUP BY`** <a href="../../"> <img src="https://upload.wikimedia.org/wikipedia/commons/2/29/Postgresql_elephant.svg" alt="PostgreSQL" title="PostgreSQL" align="right" height="64px"> </a>
## **La fonction d’agrégat `COUNT`**
Compter les upsets
```sql
-- Combien d'upsets à la table ?
SELECT COUNT(*) FROM contact; -- 16
SELECT COUNT(nom) FROM contact; -- 16 aussi
-- Les personnes dont la date de naissance est connue
SELECT COUNT(*) FROM contact WHERE date_de_naissance IS NOT NULL;
-- Connaître le nombre de prénoms différents
SELECT COUNT(DISTINCT(prenom)) FROM contact;
```
## **La fonction d’agrégat `SUM`**
En Transact SQL la function ’`SUM`’ n’est applicable qu’aux colonnes numériques
```sql
-- Obtenir la somme de tous les âges
SELECT SUM(age) FROM contact; -- 506 yo
-- Obtenir la somme de la première ligne
SELECT SUM(1) FROM contact; -- 16 yo
-- Obtenir la somme des 7 premières lignes
SELECT SUM(7) FROM contact; --112 yo
-- Cumuler l'âge des femmes
SELECT SUM(age) FROM contact WHERE sexe = 'F'; --222
SELECT SUM(age) FROM contact WHERE sexe = ('F'); --222
```
## **La fonction d’agrégat `GROUP BY`**
```sql
-- Coombien de personne masculine née en 1976 y a t-il ?
SELECT COUNT(*) as Total , sexe , date_de_naissance FROM contact
	WHERE sexe = 'M' AND date_de_naissance::text LIKE '1976%'
	GROUP BY sexe , date_de_naissance; --2
```