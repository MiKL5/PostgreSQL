# **La jointure `CROSS JOIN`** <a href="../../"> <img src="https://upload.wikimedia.org/wikipedia/commons/2/29/Postgresql_elephant.svg" alt="PostgreSQL" title="PostgreSQL" align="right" height="64px"> </a>
Cette jointure est plus rare.  

La jointure croisée est le produit cartésien de deux tables. C’est-à-dire une multiplication généralisée.  
Par conséquent, les linges seront associées de la première à la seconde table.
```sql
-- Croiser les tables client (9 lignes) et commande (5 lignes)
SELECT * FROM client B
	CROSS JOIN commande A; -- IL y a un tableau de 45 lignes  -- Les "idclient" ont été multipliés par les "idcommende".
-- Utile pour multiplier les données de plusieurs tables
```
Elle sert à
* Combiner des données de plusieurs tables pour une analyse complète  
  La jointure croisée peut être utile pour obtenir une vue d’ensemble de toutes les données de plusieurs tables liées, même si elles n’ont pas de relation directe.
* On peut l’utiliser pour générer un ensemble de données complet à des fins de test ou pour créer des exemples de combinaisons possibles.
* Identifier les relations potentielles entre les tables qui n’étaient pas évidentes au départ.  

La jointure croisée peut générer un très grand nombre de résultats.