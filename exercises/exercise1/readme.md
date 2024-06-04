# **Créer/supprimer une base de données** <a href="../../"> <img src="https://upload.wikimedia.org/wikipedia/commons/2/29/Postgresql_elephant.svg" alt="PostgreSQL" align="right" height="64px"> </a>

## **Définition**
Une base de données est un conteneur permettant de stocker & à organiser et retrouver l'intégralité les données.  
Ça facilite l'interrogation, la mise à jour et la suppression des données, les sauvegardes, une restauration et cætera.  

Si les données étaient sur plusieurs fichiers Excel, une seule base de données peut tout centraliser. 

## **La création**
* Clique droit sur "Create database" ;
```sql
-- Le code TSQL est
CREATE DATABASE formation
    WITH
    OWNER = postgres
    ENCODING = 'UTF8'
    LOCALE_PROVIDER = 'libc'
    CONNECTION LIMIT = -1
    IS_TEMPLATE = False;
```
* La nommée ;
* "Owner" est le propriétaire ;
* Dans "Définition", il est possible de changer l'encodage, le modèle, la "Tablespace (où seront stockés les fichiers)", le conllectionneemnt, le type de caractères, les limites de connexion(-1 = illimité)... ;
* La sécurité peut-être définie pour la lecture et l'écriture ;
* Les paramètres ;
* L'onglet avancé (les restrictions de schéma) ;
* SQL : pour créer la base en Transact-SQL.

## **Le renomage**
Clique droit "Propriétés", dans l'onglet SQL 
```sql
ALTER DATABASE formation RENAME TO "FORMATION";
```

## **La suppression**
```sql
DROP DATABASE IF EXISTS formation;
```
Où par un clique droit "Supprimer" ou "Delete (Force)"