# **Sélectionner et filtrer les données avec le WHERE** <a href="../../"> <img src="https://upload.wikimedia.org/wikipedia/commons/2/29/Postgresql_elephant.svg" alt="PostgreSQL" align="right" height="64px"> </a>

La clause `SELECT` permet la sélection et l'extraction des données en SQL.  
À la fin la clause `WHERE` filtre.
```sql
-- Sélectionne toutes les colonnes de la table dans la colonne nom ayant la valeur 'thuillier' 
SELECT prenom , nom FROM ma_table;
SELECT nom , prenom FROM ma_table;
SELECT * FROM ma_table WHERE nom='thuillier';
```

___
>>>NOTA  
Pour agir dans la table `FROM` est obligatoire et pour filtrer `WHERE` est obligatoire.