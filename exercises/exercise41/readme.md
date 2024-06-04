# **La contrainte `DEFAULT`**  <a href="../../"> <img src="https://upload.wikimedia.org/wikipedia/commons/2/29/Postgresql_elephant.svg" alt="PostgreSQL" title="PostgreSQL" align="right" height="64px"> </a>
Il s’agie d’une valeur par défaut à cas ou une valeur n’est pas assignée.  
Son but est d’être plus présentable que `NULL`.  
```sql
-- Créer uen table avec une valeur par défaut
CREATE TABLE IF NOT EXISTS test_default (Test VARCHAR(200) DEFAULT 'Non renseigné' , courriel VARCHAR(200) );
-- Insérer Ludivine dont le e-mail est l@gmail.com
INSERT INTO test_default VALUES('Ludivine' , 'l@gmail.com');
-- Ajouter juste le courriel mary@dupot.com et la contrainte DEFAULT pour la colonne test
INSERT INTO test_default VALUES(DEFAULT, 'mary@dupont.com');

-- Ajouter une contrainte `DEFAULT` pour le courriel
ALTER TABLE IF EXISTS test_default ALTER COLUMN courriel SET DEFAULT 'e-mail non renseigné';
-- Entrer les valeurs par defaut et vérifier
INSERT INTO test_default VALUES(DEFAULT , DEFAULT);
```