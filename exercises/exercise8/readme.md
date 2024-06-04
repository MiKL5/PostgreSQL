# **L’opérateur `LIKE`** <a href="../../"> <img src="https://upload.wikimedia.org/wikipedia/commons/2/29/Postgresql_elephant.svg" alt="PostgreSQL" title="PostgreSQL" align="right" height="64px"> </a>


`LIKE` est souvent utilisé lors des requêtes avec ProstgreSQL et d’autres DBMS car, cette opérateur est assez puissant pour les affinités de recherches via `WHERE`.

Il peut fonctionner comme la commande `WHERE`.
```sql
SELECT nom FROM contact WHERE nom='Marchand';
```
Avec l’opérateur `LIKE` le resultat est identique
```sql
SELECT nom FROM contact WHERE nom LIKE 'Marchand';
```
Nonobstant permet d’affiner les recherches.
Maintenant, il me fuat tous les noms avec la lettre ‘V’
```sql
SELECT nom FROM contact WHERE nom LIKE '%V%';
```
Et maintenant tous les prénoms ayant la lettre ‘N’
```sql
SELECT prenom FROM contact WHERE prenom LIKE '%n%';
```
J’ai maintenant besoin de la liste des personnes nées en août.
```sql
-- Cette syntaxe est fausse avec PostgreSQL,
SELECT date_de_naissance FROM contact WHERE date_de_naissance LIKE '%08%';
-- Il faut une convsion explecite de type
```
Il faut donc _convertir explicitement_ la date en texte grâce à `::text`
```sql
SELECT date_de_naissance FROM contact WHERE date_de_naissance::text LIKE '%08%';
SELECT date_de_naissance FROM contact WHERE date_de_naissance::text LIKE '%8%';
```
Tous les prénoms se termiants par ‘e’
```sql
SELECT prenom FROM contact WHERE prenom LIKE '%e';
```
Tous les prénoms ayant le ‘a’ en seconde position et finisssant par ‘e’
```sql
SELECT prenom FROM contact WHERE prenom LIKE '_a%e';
```
Les prénoms ayant le ‘n’ en troisièem et le ‘e’ à la fin
```sql
SELECT prenom FROM contact WHERE prenom LIKE '__n%e';
```