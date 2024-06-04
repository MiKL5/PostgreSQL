# **Créer une table à partr d’un `SELECT`** <a href="../../"> <img src="https://upload.wikimedia.org/wikipedia/commons/2/29/Postgresql_elephant.svg" alt="PostgreSQL" title="PostgreSQL" align="right" height="64px"> </a>

Cela est un clone.  
Soit avec toutes les données, soit qu’avec la structure.
## **Créer un clone**
```sql
CREATE TABLE contact_2 AS SELECT * FROM contact;
```
## **Cloner la structure**
```sql
CREATE TABLE contact_3 AS SELECT * FROM contact WITH NO DATA;
```