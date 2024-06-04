# **La jointure `INNER JOIN`** <a href="../../"> <img src="https://upload.wikimedia.org/wikipedia/commons/2/29/Postgresql_elephant.svg" alt="PostgreSQL" title="PostgreSQL" align="right" height="64px"> </a>
Les jointures sont énormément utilisées en SQL et qssocient plusieurs tables en une requête.  
Le but est d’obtenir un résultat combinant plusieurs tables efficaceemnet.  
```sql
-- Séléctionne la colonne client de la table commande alias A, en faisant une jointure sur la bale client alias B, en spécifiant les 2 colonnes la jointure est faite.
SELECT A.IDclient FROM commande A INNER JOIN table_client B ON A.IDclient = B.IDclient
```

`INNER JOIN` est la jointure interne, elle retroune len enregistraments quand la condition est vrai dans les 2 tables. C’est l’une des plus utilisée.  
```sql
-- Quuels sont les clients qui ont un numéro de commande
SELECT A.idclient FROM commande A
	INNER JOIN client B
	ON A.idclient = B.idclient;
-- Idem avec les noms et prénoms
SELECT A.idclient , B.nom , B.prenom FROM commande A
	INNER JOIN client B
	ON A.idclient = B.idclient;
-- Idem sans INNER
SELECT A.idclient , B.nom , B.prenom FROM commande A
	JOIN client B
	ON A.idclient = B.idclient;
```
Il n’y a pas d’incidences avec les jointures
```sql
SELECT A.numerodecommande , A.idclient , B.nom , B.prenom FROM commande A
	JOIN client B
	ON A.idclient = B.idclient;
-- Inverser les jointures
SELECT A.numerodecommande , A.idclient , B.nom , B.prenom FROM commande A
	JOIN client B
	ON B.idclient = A.idclient
```

<!-- ___
>>> INNER est sous entendu -->