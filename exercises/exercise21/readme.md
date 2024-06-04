# Les fonctions de types de chaîne de caractères ’`OVERLAY`’, ’`POSITION`’ et ’`REVERSE`’ <a href="../../"> <img src="https://upload.wikimedia.org/wikipedia/commons/2/29/Postgresql_elephant.svg" alt="PostgreSQL" title="PostgreSQL" align="right" height="64px"> </a>
## **La fonction ’`OVERLAY`’**
La fonction ’`OVERLAY`’ (couvrir/recouvrir) sert à replacer un texte ou chaîne de caractère par un autre texte ou sou-chaîne.
```sql
-- Remplacer les catactères depuis le troisème
SELECT OVERLAY('w1234567rce' PLACING 'resou' FROM 3);
-- depuis le troisième replacer les cinq prochiains caractères
SELECT OVERLAY('w1234567rce' PLACING 'resou' FROM 3 FOR 6);
```
## **La fonction ’`POSITION`’**
La fonction peut utilisée `POSITION` de PostgreSQL sert à trouver l’emplacement d’une sous-chaîne dans uen chaîne.
```sql
-- Dès quel position de caractère commance 'our'
SELECT POSITION('our' IN 'w3resource');
-- Quelle est la position de 'a' dans la colonne 'prenom' de la table 'contact'
SELECT prenom , POSITION('a' IN prenom) FROM contact;
```
## **La fonction ’`REVERSE`’**
Assez rare en SQL.
```sql
SELECT REVERSE('w3resource');
```