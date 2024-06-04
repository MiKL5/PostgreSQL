# **Les jointures `LEFT JOIN` et `RIGHT JOIN`** <a href="../../"> <img src="https://upload.wikimedia.org/wikipedia/commons/2/29/Postgresql_elephant.svg" alt="PostgreSQL" title="PostgreSQL" align="right" height="64px"> </a>
## **La jointure `LEFT JOIN`**
Il s’agit d’une jointure externe retournant tous les enregistrements de la table de gauche avec les valeurs concordantes à celle de droite.  
Pour afficher les valeurs ne correspondants pas à celle de droite, il y a le filtre `IS NULL` avec la commande `WHERE`.
```sql
-- Qui n'est pas rattaché à un id client de la table commande
SELECT B.idclient , B.nom , B.prenom FROM client B -- conscidère la table client
	LEFT JOIN commande A -- pas la table commande
	ON A.idclient = B.idclient;
-- ça ne fonctionne pas? est-ce qu'avec `IS NULL` permettrai d'afficher que les valeurs ne concordants qu'à la table de gauche
SELECT B.idclient , B.nom , B.prenom FROM client B -- conscidère la table client
	LEFT JOIN commande A -- pas la table commande
	ON A.idclient = B.idclient
	WHERE A.idclient IS NULL; -- ça fonctionne, il s'agit de 12 et 13
-- avec l'ancienne syntaxe
SELECT B.idclient , B.nom , B.prenom FROM client B -- conscidère la table client
	LEFT OUTER JOIN commande A -- pas la table commande
	ON A.idclient = B.idclient
	WHERE A.idclient IS NULL;
```
## **La jointure `RIGHT JOIN`**
Cette jointure externe fait l’opposé.   
Idem pour retourner les valeurs non concordantes.
```sql
-- Avoir le même résultat en inversant les tables
SELECT B.idclient , B.nom , B.prenom FROM commande A -- conscidère la table commande
	RIGHT JOIN client B -- pas la table client
	ON A.idclient = B.idclient
	WHERE A.idclient IS NULL;
-- Avec l'ancienne syntaxe
SELECT B.idclient , B.nom , B.prenom FROM commande A -- conscidère la table commande
	RIGHT OUTER JOIN client B -- pas la table client
	ON A.idclient = B.idclient
	WHERE A.idclient IS NULL;
```