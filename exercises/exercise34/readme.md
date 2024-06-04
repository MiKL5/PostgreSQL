# **Les fonctions de partitionnement `ROWS/RANGE UNBOUNDED PRECEDING` et `FIRST VALUES/LAST VALUES`** <a href="../../"> <img src="https://upload.wikimedia.org/wikipedia/commons/2/29/Postgresql_elephant.svg" alt="PostgreSQL" title="PostgreSQL" align="right" height="64px"> </a>
> Définition :  
> `LAG` accèdes aux données d’une ligne précédente dans le même jeu de résultat.  
> `LEAD` accède aux données à partir d’une ligne ultérieure dans le même jeu de résultat.  
> Trés puissant pour des rapports de business intelligence (e.g.: prévoir les ventes suivantes).
```sql
-- Affichier le résultat précédant avec 'LAG'
SELECT product_id , product_name , price ,
	LAG(price , 1 , 0)
	OVER(ORDER BY product_id) previous_result
	FROM product;
--Idem avec un saut de 2
SELECT product_id , product_name , price ,
	LAG(price , 2 , 0)
	OVER(ORDER BY product_id) previous_result
	FROM product;
-- Afficher le résultat suivant grâce à 'LEAD'
SELECT product_id , product_name , price ,
	LEAD(price , 1 , 0)
	OVER(ORDER BY product_id) forward_result
	FROM product
-- Avec un saut de 2
SELECT product_id , product_name , price ,
	LEAD(price , 2 , 0)
	OVER(ORDER BY product_id) forward_result
	FROM product;
```
## **`NTH_VALUE`** <!-- N'existe pas sur SQL server -->
```sql
-- QUel est le second plus cher
SELECT product_id , product_name , price ,
	NTH_VALUE(product_name , 2) -- iPhone
	OVER(ORDER BY price DESC RANGE BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING)
	FROM product;
-- QUel est le plus cher
SELECT product_id , product_name , price ,
	NTH_VALUE(product_name , 1) -- HP Elite
	OVER(ORDER BY price DESC RANGE BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING)
	FROM product;
-- Le quatrième plus cher sans partitionnement
SELECT product_id , product_name , price ,
	NTH_VALUE(product_name , 4) --Lenovo Thinkpad
	OVER(ORDER BY price DESC) -- Trois lignes null
	FROM product;
```
<!-- Il faut faire une fonction de partitionnement 'RANGE()'  
et entre le précédent est le suivant sinon 'NULL' -->