# **Les fonctions de types de chaîne de caractères `TRANSLATE`, `CONCAT`, `STRING_SPLIT`** <a href="../../"> <img src="https://upload.wikimedia.org/wikipedia/commons/2/29/Postgresql_elephant.svg" alt="PostgreSQL" title="PostgreSQL" align="right" height="64px"> </a>
## **`SPLIT`**
```sql
-- Chercher la troisième valeur dans le tableau proposé
SELECT SPLIT_PART('A,B,C', ',', 3);
```
## **`CONCAT`**
```sql
SELECT CONCAT('w' , 3, 'r', 'esource', '.' , 'com');
```
## **La fonction `TRANSLATE`**
La fonction translate de PostgreSQL traduit n’importe quel caractère de la chaîne par un autre dans la ‘replace_string’.
Elle peut changer dynamiquement des chaînes de caractères.
```sql
SELECT TRANSLATE('translate' , 'rnlt' , '123');
```

<!-- ___
>>>NOTA  
https://w3resource.com/postrgresql/translate-function.php/ -->