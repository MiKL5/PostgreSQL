# **`DISTINCT` et les opérateurs de comparaison** <a href="../../"> <img src="https://upload.wikimedia.org/wikipedia/commons/2/29/Postgresql_elephant.svg" alt="PostgreSQL" title="PostgreSQL" align="right" height="64px"> </a>


## **La liste des personnes ayant moins de 22 ans**
```sql
SELECT * FROM contact WHERE age < 22;
```
## **La lsite des personnes ayant 22 ans et moins**
```sql
SELECT * FROM contact WHERE age <= 22;
```
## **La liste des personnes ayant plus de 34 yo**
```SQL
SELECT * FROM contact WHERE age > 34;
```
## **Les personnes ayant 34 ans et plus**
```sql
SELECT * FROM contact WHERE age >= 34;
```
## **Les ages différents de 41**
```sql
SELECT * FROM contact WHERE age <> 41;
SELECT * FROM contact WHERE age != 41; -- ancienne manière
```
## **Les personnes de 41 yo**
```sql
SELECT * FROM contact WHERE age = 41;
```
## **Il ne faut pas  afficher les doublons**
```sql
SELECT nom FROM contact WHERE nom='Virenque'; -- est en double
SELECT DISTINCT nom FROM contact WHERE nom='Virenque';
SELECT DISTINCT nom FROM contact;
```