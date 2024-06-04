# **La jointure `LEFT JOIN` vs `NOT IN` vs `not exists`** <a href="../../"> <img src="https://upload.wikimedia.org/wikipedia/commons/2/29/Postgresql_elephant.svg" alt="PostgreSQL" title="PostgreSQL" align="right" height="64px"> </a>
Il y a plusieurs manières de faire une `LEFT JOIN`.  
Il s’agit de `NOT IN` et `NOT EXISTS`.
```sql
-- Les personnes n'ayant passer aucune commande
SELECT B.idclient , B.nom , B.prenom FROM client B
	LEFT JOIN commande A
	ON A.idclient = B.idclient
	WHERE A.idclient IS NULL; -- Il y a une ointure pluis le résultat est retoourné

-- Quel est le résultat avec "NOT IN" ?
SELECT idclient , nom , prenom
	FROM client
	WHERE idclient NOT IN
	(
		SELECT idclient
		FROM commande
	); -- Le résultat prend plus de temps et il n'y a pas de jointure (chemin direct)

-- Quel est le résultat avec "NOT EXISTS" ?
SELECT B.idclient , B.nom , B.prenom
	FROM client B
	WHERE NOT EXISTS
	(
		SELECT *
		FROM commande A
		WHERE B.idclient = A.idclient
	); -- Chemin identique à LEFT JOIN car la jointure est dans le WHERE
```