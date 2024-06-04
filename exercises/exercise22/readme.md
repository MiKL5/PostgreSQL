# **Les fonctions de types de chaîne de caractères `TRIM`, `LTRIM`, `RTRIM`, `BTRIM`, `UPPER` et `LOWER`** <a href="../../"> <img src="https://upload.wikimedia.org/wikipedia/commons/2/29/Postgresql_elephant.svg" alt="PostgreSQL" title="PostgreSQL" align="right" height="64px"> </a>
## **`TRIM`, `LTRIM`, `RTRIM`, `RTRIM`**
La fonction `TRIM` suprime le caractère spéciée audébut ou à la fin d’une chaîne.
```sql
-- Enlever la première lettre
SELECT LTRIM('entreprise' , 'e');
-- Enlever la dernière lettre
SELECT LTRIM('entreprise' , 'e');
-- Enlever la première et la dernière
SELECT BTRIM('entreprise' , 'e');
SELECT BTRIM('xyxtrimyyx' , 'yx'); -- ne laisse que TRIM
-- Autre façon d'enlever au début et à la fin
SELECT TRIM('xyxtrimyyx' , 'yx');
SELECT TRIM('entreprise' , 'e');
```
## **`UPPER`, `LOWER`**
Transforme en majuscule ou minuscule.
```sql
-- Mettre les noms en majuscule
SELECT UPPER(nom) FROM contact;
-- Mettre les noms en minuscule
SELECT LOWER(nom) FROM contact;
```