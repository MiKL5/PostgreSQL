# **La jointure `FULL (OUTER) JOIN`** <a href="../../"> <img src="https://upload.wikimedia.org/wikipedia/commons/2/29/Postgresql_elephant.svg" alt="PostgreSQL" title="PostgreSQL" align="right" height="64px"> </a>
Cette commande combine les résultats de 2 tables, puis les asociés grâce à une condition en remplissant  valeurs NULL si la condition n’est pas respectée.  
_Donc tout est combiné, pour afficher toutes les correspondances entre les 2 tables._
_L’ajout d’`IS NULL` ne combinera pas les données non concardantes._
```sql
-- Remonter toutes les données
SELECT A.idclient , B.idclient FROM commande A
	FULL OUTER JOIN client B
	ON A.idclient = B.idclient;
-- Remonter les données ne concordants pas
SELECT A.idclient , B.idclient FROM commande A
	FULL OUTER JOIN client B
	ON A.idclient = B.idclient
	WHERE B.idclient IS NULL;
-- Remonter ce qui n'est pas nul dans la table client
SELECT * FROM commande A
	FULL OUTER JOIN client B
	ON A.idclient = B.idclient
	WHERE B.idclient IS NOT NULL;
-- Remonter ce qui n'est pas null dans commande et client
SELECT * FROM commande A
	FULL OUTER JOIN client B
	ON A.idclient = B.idclient
	WHERE B.idclient IS NOT NULL AND A.idclient IS NOT NULL;
```
`OUTER` est facultatif.
```sql
-- Remonter les même données avec juste `FULL JOIN`
SELECT * FROM commande A
	FULL JOIN client B
	ON A.idclient = B.idclient
	WHERE B.idclient IS NOT NULL AND A.idclient IS NOT NULL;
```