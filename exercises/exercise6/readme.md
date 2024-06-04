# **Mettre à jour via `DELETE`** <a href="../../"> <img src="https://upload.wikimedia.org/wikipedia/commons/2/29/Postgresql_elephant.svg" alt="PostgreSQL" align="right" height="64px"> </a>


## **La syntaxe**

```sql
-- Supprime la ligne depuis ma table
DELETE FROM ma_table

DELETE FROM people WHERE prenom='Richard';
```
___
>>>NOTA  
Sans `WHERE`, tout est supprimer