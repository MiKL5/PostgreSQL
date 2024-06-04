# **Mettre à jour via `UPDATE`** <a href="../../"> <img src="https://upload.wikimedia.org/wikipedia/commons/2/29/Postgresql_elephant.svg" alt="PostgreSQL" align="right" height="64px"> </a>

La mise à jour des données se fait vie la commande `UPDATE` 

## **La syntaxe**
```sql
-- Met à jour la ligne (l'upset) ma_table en fixant à cette colonne cette valeur 'Olivier2'
UPDATE ma_table SET colonne1='Olivier2' -- sans WHERE, LES CONSESUENCES PEVENT ÊTRE DRAMATIQUES

--Méthode sûre
UPDATE people SET nom='A' where prenom='MiKL'

-- plusiers mise à jours à la fois
UPDATE people SET nom='Coeur de Lion', prenom='Richard' WHERE prenom='moi'
```

____
>>> NOTA  
`WHERE` est indispensable pour modifier la bonne ligne. Sans lui toutes les lignes sont setés.