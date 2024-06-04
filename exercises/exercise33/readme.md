# **Les fonctions de partitionnement `ROWS/RANGE UNBOUNDED PRECEDING` et `FIRST VALUES/LAST VALUES`** <a href="../../"> <img src="https://upload.wikimedia.org/wikipedia/commons/2/29/Postgresql_elephant.svg" alt="PostgreSQL" title="PostgreSQL" align="right" height="64px"> </a>
> Définitions :  
> `UNBOUNDED PRECEDING` : toutes les lignes précédants l’actuelle ;  
> `UNBOUNED FOLLOWING` : toutes les lignes suivants l’actuelle ;  
> `x PRECEDING` : x lignes précédants l’actuelle ;  
> `y FOLLOWING` : y lignes suivants l’actuelle.
## **`ROWS/RANGE UNBOUNDED PRECEDING`**
```sql
SELECT group_id , salarie ,
	SUM(salarie) OVER(ORDER BY group_id ROWS UNBOUNDED PRECEDING) cumulativeSumByRows , -- chaque rangée est additionnée
	SUM(salarie) OVER(ORDER BY group_id RANGE UNBOUNDED PRECEDING) cumulativeSumByRange -- via 'groupid' chaque  range entre en compte (calcul par rang)
	FROM salarie;
```
## **`FIRST VALUES/LAST VALUES`**
```sql
SELECT group_id , salarie ,
	FIRST_VALUE(salarie) OVER(PARTITION BY group_id ORDER BY group_id) firstOrderTotal , -- Récupère la permière valeur de chaque partition
	LAST_VALUE(salarie) OVER(PARTITION BY group_id ORDER BY group_id) lastOrderTotal -- Fait l'inverse
	FROM salarie;
```
<!-- ___
unbounded = non borné, non limité 
range = interval -->