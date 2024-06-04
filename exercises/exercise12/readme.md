# **Les opérateurs `AND` et `OR`**<a href="../../"> <img src="https://upload.wikimedia.org/wikipedia/commons/2/29/Postgresql_elephant.svg" alt="PostgreSQL" title="PostgreSQL" align="right" height="64px"> </a>

## **L’opérateur AND**
Les deux conditions sont réunies.
```sql
-- Lister les hommes de moins de 41 ans
SELECT * FROM contact WHERE sexe='M' and age < 41;
-- liste des personnes dés en août de plus de 16 ans
SELECT * FROM contact WHERE date_de_naissance::text LIKE '%8%' AND age > 16;
-- liste de personne de 101 ans, née en août
SELECT * FROM contact WHERE date_de_naissance::text LIKE '%8%' AND age = 101; -- ne rtourne rien
-- Afficher Portail et Virenque
SELECT *+* FROM contact WHERE nom='Protail' AND nom='Virenque'; -- AND ne s'applique pas à la même colonne
```
## **L’opétateur `OR`**
Une condition est réunie
```sql
-- Liste des personnes nées en aoüt ou de 101 ans
SELECT * FROM contact WHERE date_de_naissance::text LIKE '%8%' OR age = 101;
-- Liste des personnes nées en août et de plus de 16
SELECT * FROM contact WHERE date_de_naissance::text LIKE '%08%' OR age > 16; -- affiche les deux conditions
-- Afficher Portail ou Virenque
SELECT * FROM contact WHERE nom='Protail' OR nom='Virenque'; -- Affiche les deux
```