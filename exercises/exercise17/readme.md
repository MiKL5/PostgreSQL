# **Le `CASE ... WHEN ...`** <a href="../../"> <img src="https://upload.wikimedia.org/wikipedia/commons/2/29/Postgresql_elephant.svg" alt="PostgreSQL" title="PostgreSQL" align="right" height="64px"> </a>
Évalue une liste de conditions et retourne une expression de résultats possibles.
```sql
-- Ajouter "Mme" pour une femme et "M." pour un homme
SELECT * ,
	CASE
        WHEN sexe = 'F' THEN 'Mme'
		WHEN sexe = 'M' THEN 'M.'
	END
	FROM contact;
    
-- Préciser si le sujet a moins ou plus de 20 ans
SELECT * ,
	CASE
		WHEN age BETWEEN 16 AND 20 THEN 'Le sujet a moins de 20 ans.' ELSE 'Le sujet a plus de 20 ans.'
	END
	FROM contact;


```