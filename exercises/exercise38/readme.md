# **Qu’est-ce que le bloc structure** <a href="../../"> <img src="https://upload.wikimedia.org/wikipedia/commons/2/29/Postgresql_elephant.svg" alt="PostgreSQL" title="PostgreSQL" align="right" height="64px"> </a>
Il s’agit d’uun block qui à deux sections
* Une déclaration (facultative) ;
* Un corps (obligatoire).

Il est possible des bloc, sous-bloc, sous sous bloc, à l’infini.
```sql
-- Créer un bloc
DO $$
<<debut>> -- début du bloc
DECLARE counter int = 0; -- le compteur commence à 0
BEGIN -- début de l'action
	counter := counter + 1; -- +1
	RAISE NOTICE 'La valeur actuelle est %', counter; -- gestion des erreurs, tel que print en SQL -- % pour affichr la chaîne de caratères
END debut $$; -- Fin du bloc

-- Créer un sous-bloc
DO $$
<<premier_bloc>>
DECLARE -- 1er bloc
	counter int := 0;
BEGIN
	counter := +1;
	RAISE NOTICE 'La valeur est %' , counter;
	DECLARE -- sous bloc
		counter int := 0;
	BEGIN
		counter := +10;
		RAISE NOTICE 'La valeur de ce sous bloc est %' , counter;
		RAISE NOTICE 'Celle du bloc est %' , premier_bloc.counter;
	END;
	RAISE NOTICE 'La valeur du bloc est %' , counter;
END premier_bloc $$;
-- retirer 'premier_bloc' est observer le résultat
DO $$
<<premier_bloc>>
DECLARE -- 1er bloc
	counter int := 0;
BEGIN
	counter := +1;
	RAISE NOTICE 'La valeur est %' , counter;
	DECLARE -- sous bloc
		counter int := 0;
	BEGIN
		counter := +10;
		RAISE NOTICE 'La valeur de ce sous bloc est %' , counter;
		RAISE NOTICE 'Celle du (sous) bloc est %' , counter;
	END;
	RAISE NOTICE 'La valeur du bloc est %' , counter;
END premier_bloc $$;
```