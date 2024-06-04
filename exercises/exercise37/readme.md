# **Définition et explication d’une procédure stockée** <a href="../../"> <img src="https://upload.wikimedia.org/wikipedia/commons/2/29/Postgresql_elephant.svg" alt="PostgreSQL" title="PostgreSQL" align="right" height="64px"> </a>
<!-- > Apparue à la version 11 de PostgreSQL.   -->
> C’est un ensemble d’instruction, compilé en base de donnée.  
> Pouvant contenir les instructions `INSERT`, `UPDATE`, `DELETE`. Contrairement à une Vue.  
> C’est une simplification du code.
>
> La procédure est différente d’SQL Server bien que ce soit du T-SQL.
```sql
-- Crée une procédure insérant des données dans la table 'contact'.
CREATE OR REPLACE PROCEDURE ps_insert_to_contact(_nom text , _prenom text , _age int , _sexe text , _date_de_naissance date)
LANGUAGE SQL -- SQL ou PLpsSQL
AS $$ -- peut importe le nom
INSERT INTO contact(nom , prenom , age , sexe , date_de_naissance)
VALUES(_nom , _prenom , _age , _sexe , _date_de_naissance);
$$; -- Fin
-- L'utiliser pour un ajout
CALL ps_insert_to_contact ('Bouchon' , 'Damien' , 25 , 'M' , '1983-5-6');
-- Vérifier l'ajout
SELECT * FROM contact;

-- Modifier la procedure
CREATE OR REPLACE PROCEDURE ps_insert_to_contact(_nom text , _prenom text)
LANGUAGE SQL
AS $$
INSERT INTO contact(nom , prenom)
VALUES(_nom , _prenom);
$$;
-- OU
CREATE OR REPLACE PROCEDURE ps_insert_to_contact(_nom text , _prenom text)
LANGUAGE SQL
AS $$
UPDATE contact SET nom = _nom WHERE prenom = _prenom
$$;
--Ajouter uñcontact
CALL ps_insert_to_contact ('DUBONCHON' , 'Damien');
--Vérifier
SELECT * FROM contact;

-- Créer uen procédure stockée qui supprime
CREATE OR REPLACE PROCEDURE ps_delete_to_contact(_nom text)
LANGUAGE SQL
AS $$
DELETE FROM contact WHERE nom =_nom
$$;
-- Supprimer 'BOUCHER'
CALL ps_delete_to_contact ('BOUCHER');
-- Vérifier qu'il n'y est plus
SELECT * FROM contact;
```
<!-- CREATE OR REPLACE PROCEDURE : REPLACE est pour l'alter. -->
Il faut strictement suivre la procédure<!-- (aucune info ne doit manquée)-->.