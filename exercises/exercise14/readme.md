# **Les fonctions d’agrégat `MIN`, MAX``, `AVERAGE`** <a href="../../"> <img src="https://upload.wikimedia.org/wikipedia/commons/2/29/Postgresql_elephant.svg" alt="PostgreSQL" title="PostgreSQL" align="right" height="64px"> </a>
**Voici la liste des âges**
```sql
SELECT * FROM contact ORDER BY age ASC;
```
## **La fonction d’agrégat `MIN`**
```sql
-- La plus jeune
SELECT MIN(age) FROM contact; -- 16yo
-- L'âge minimum des personnes nés en 1976
SELECT MIN(age) FROM contact WHERE date_de_naissance::TEXT LIKE '1976%'; -- 18yo
-- Toutes les personnes nées en 1976
SELECT * FROM contact WHERE date_de_naissance::TEXT LIKE '1976%';
-- Le minimum des noms
SELECT MIN(nom) FROM contact;
```
## La fonction d’agrégat `MAX`
```sql
-- L'ainé
SELECT MAX(age) FROM contact; -- 48yo
-- L'âge maximum des personnes aux prénoms commence par "E"
SELECT MAX(age) FROM contact WHERE prenom LIKE 'E%';
-- Le maximum des noms
SELECT MAX(nom) FROM contact; -- Virenque
```
## **La fonction d’agrégat `AVERAGE`**
```sql
-- L'âge moyen
SELECT AVG(age) FROM contact; -- 31,625
```
