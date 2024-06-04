# **Créer, modifier et supprimer une base de données** <a href="../../"> <img src="https://upload.wikimedia.org/wikipedia/commons/2/29/Postgresql_elephant.svg" alt="PostgreSQL" align="right" height="64px"> </a>

## **Définition**
Une table est une _relation_. Elle peut avoir des relation avec d'autres tables.  
C'est le principe d'un sye de gestion de base de données relationnelle.  

Une relation/table est constituée de ligne et de colonne.  

Une colonne est un _attribut_.  
Et une ligne est un _upset_.

Chaque _upset_ correspond à un enregistrement de données.  

## **La syntaxe**
Pour toutes les bases de données.
```sql
-- Créer la table, avec le nom de la colonne, recevant pour type (ici, chaîne de caractère) acceptant jusqu'à 200 caractères
CREATE TABLE IF NOT EXISTS ma_table (Nom VARCHAR(200) );
CREATE TABLE ma_table2 (Nom VARCHAR(200),prenom VARCHAR(200) );
CREATE TABLE ma_table2 (Nom VARCHAR(200) prenom VARCHAR(200) ); --erreur car il manque la virgule
```

## **Ouvir une nouvelle requête**
Symbole base de donnée avec le rectangle play, autrefois, c'était un éclair.

## **Valider une requête**
Appuiyer la touche <kbd>F5</kbd> valide la requête séléctionnée.  
Un message vert en bas à droite indique le succés ou non.

## **Où sont les tables ?**
Dans `Schémas`, puis `public` qui est le format par défaut, puis `tables`

## **Mofifier**
* Clique droit `propritétés` et changer le nom
* en T-SQL
```sql
ALTER TABLE IF EXISTS public.ma_table2
    RENAME TO ma_table;
```

## **Supprimer**
En T-SQL
```sql
-- Supprmer la table à ce schéma, dont le nom est
DROP TABLE IF EXISTS public.ma_table2;
```