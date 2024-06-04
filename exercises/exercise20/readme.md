# Les fonctions de types de chaîne de caractères ’`LENGHT`’, ’`REPLACE`’ et ’`SUBSTRING`’ <a href="../../"> <img src="https://upload.wikimedia.org/wikipedia/commons/2/29/Postgresql_elephant.svg" alt="PostgreSQL" title="PostgreSQL" align="right" height="64px"> </a>

## **Remplacer toutes les occurences d’une valeur de type chaîne spécifiée par une autre valeur de type de chaîne**
```sql
-- Remplacer la valeur par une autre
SELECT REPLACE ('Salut à vous' , 'Salut' , 'Bonjour');
-- Remplacer le prenom Sandrine par Sandra
SELECT prenom, REPLACE(prenom , 'Sandrine' , 'Sandra') FROM contact;
```
## **Calculer la longueur de la chaîne de caractère prénom**
```sql
SELECT prenom , LENGTH(prenom) as longueur FROM contact;
```
## **Extraire une chaîne de catacère depuis une longueur spécifique**
```sql
-- Extraire le premier caractère du prénom
SELECT SUBSTRING(prenom , 1 , 1) as initiale , prenom FROM contact;
-- Extraire 3 caractèes, à partire de la troisième lettre
SELECT SUBSTRING(prenom , 2 , 3) as initiale , prenom FROM contact;
```