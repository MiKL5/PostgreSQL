# **La clause `LIMIT`, la concaténation et les alias d’attributs** <a href="../../"> <img src="https://upload.wikimedia.org/wikipedia/commons/2/29/Postgresql_elephant.svg" alt="PostgreSQL" title="PostgreSQL" align="right" height="64px"> </a>


## **Afficher une nombre limite d’upsets**
```sql
SELECT * FROM contact LIMIT 5;
```

## **Afficher une limite d’upsets hormis quelques unes**
```sql
SELECT * FROM contact LIMIT 10 OFFSET 2;
```

## **Utiliser les alias de colonnes**
```sql
SELECT nom || ' ' || prenom AS Nom_et_prenom FROM contact;
```