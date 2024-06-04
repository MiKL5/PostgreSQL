# **La jointure avec plusieurs tables** <a href="../../"> <img src="https://upload.wikimedia.org/wikipedia/commons/2/29/Postgresql_elephant.svg" alt="PostgreSQL" title="PostgreSQL" align="right" height="64px"> </a>
```sql
-- Addicher les clients ayant un numéro de commande et une carte de fidélité
SELECT A.idclient FROM commande A
	INNER JOIN client B
	ON B.idclient = A.idclient
	INNER JOIN carte_fidelite C
	ON B.idclient = C.idclient
	WHERE C.fidele = 'OUI';
```