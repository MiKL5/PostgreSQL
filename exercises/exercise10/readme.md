# **`IN` , `NOT IN` , `IS NULL` , `IS NOT NULL`**<a href="../../"> <img src="https://upload.wikimedia.org/wikipedia/commons/2/29/Postgresql_elephant.svg" alt="PostgreSQL" title="PostgreSQL" align="right" height="64px"> </a>

## **L’utilisation de `IN`**
```sql
-- Toute personne nommée "DUTRUEL"
SELECT * FROM contact WHERE nom in ('Dutruel'); -- L'upset complet apparait
```
## **L’utilisation de `NOT IN`**
```sql
-- les sujets féminins
SELECT * FROM contact WHERE sexe NOT IN ('M');
```
## **Plusieurs valeurs peuvent être dans `IN` et `NOT IN`**
```sql
-- trouver "DUTRUEL" e "THUILLIER"
SELECT * FROM contact WHERE nom IN ('Dutruel' , 'Thuillier');

-- Afficher tous les contacts saut "DUTRUEL" et "THUILLIER"
SELECT * FROM contact WHERE nom NOT IN ('Dutruel' , 'Thuillier');
```
## **Insérer une valeur NULL**
En SQL une valeur nulle ne représente rien, le champs n’est pas renseigné.
```sql
INSERT INTO contact VALUES ('Bourgeon' , 'Elodie' , 43 , 'F' , NULL);
```
## **Afficher les upsets aux dates de naissance renseignées**
```sql
SELECT * FROM contact WHERE date_de_naissance IS NOT NULL;
```
## **Afficher les upsets aux dates de naissances manquantes**
```sql
SELECT * FROM contact WHERE date_de_naissance IS NULL;
```