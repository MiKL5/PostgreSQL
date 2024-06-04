# **L’agrégation dans les fonctions de partitionnement** <a href="../../"> <img src="https://upload.wikimedia.org/wikipedia/commons/2/29/Postgresql_elephant.svg" alt="PostgreSQL" title="PostgreSQL" align="right" height="64px"> </a>
Pour savoir combien il reste d’article, il faut une fonction de partitionnement, donc du T-SQL.
```sql
-- Essayer avec 'SUM()'
SELECT product_name , price , SUM(price) FROM product
WHERE product_name = 'Microsoft Lumia'
GROUP BY product_name , price; -- Il y a une liste mais, c'est pas agréger
-- Partitionner avec 'OVER()'
SELECT product_name , price ,
    COUNT(*) OVER(PARTITION BY product_name ORDER BY product_id)
FROM produit;
-- Partitionner avec 'AVG()'
SELECT product_name , price ,
    AVG(price) OVER(PARTITION BY product_name ORDER BY product_id)
FROM produit; -- La moyenne de prix est connue
```