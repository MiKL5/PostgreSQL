# **La jointure `EXCEPT` vs `INTERSECT`** <a href="../../"> <img src="https://upload.wikimedia.org/wikipedia/commons/2/29/Postgresql_elephant.svg" alt="PostgreSQL" title="PostgreSQL" align="right" height="64px"> </a>
Ce sont des vieux opérateurs avec Transact-SQL.  
`INTERSECT` est une jointures interne, donc `INNER JOIN`.  
```sql
-- Faire une jointure interne avec `INTERSECT`
SELECT idclient
	FROM commande
	INTERSECT
		SELECT idclient
		FROM client
		ORDER BY idclient; -- sans `ORDER BY`, c'est dans le désordre
```
L’opérateur `EXCEPT` est un `LEFT JOIN`.  
Il correspond aussi à `NOT IN`.
```sql
SELECT idclient
	FROM commande
	INTERSECT
		SELECT idclient
		FROM client
		ORDER BY idclient;
```