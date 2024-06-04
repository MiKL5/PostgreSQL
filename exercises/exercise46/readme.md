# **Explication d’un séquence** <a href="../../"> <img src="https://upload.wikimedia.org/wikipedia/commons/2/29/Postgresql_elephant.svg" alt="PostgreSQL" title="PostgreSQL" align="right" height="64px"> </a>
C’est une liste ordonée d’entiers, sachant que les ordres de nombres sont importants dans la séquance.  
E.g. [1 , 2 , 3] ou [3 , 2 , 1] sont différentes.  

Dans PostgreSQL, elle est un objet lié au schéma défini par l’utilisateur qui génère une séquence d’entiers basés sur une spécifiication précisée.  
C’est une séquence et une prolongation de l’identité à une autre table afin de suivre l’incrémentation.  
Donc, une table particulière permettant de générer proprement un nombre.  
Ces nombres émanent d’une suite préalablement paramétrés dans la séquence.  

Elle est utilisable sur plusieurs table distinctes.

Une séquence peut être médifiée.

PGAdmin permet de voir la prochaine valeur de la séquence
```sql
-- Créer uen séquence démarrant à 100 et à l'incrément de 5
CREATE SEQUENCE masequence INCREMENT 5 START 100;
--- QUel est le prochain incrément
SELECT NEXTVAL('masequence');

-- Créer une séquence à l'incrément -1, valeur minimum 1 et maxi 3, démarrant à 3, puis recycle
CREATE SEQUENCE three
INCREMENT -1
MINVALUE 1
MAXVALUE 3
START 3
CYCLE;
-- Quel est le prochain incrément
SELECT NEXTVAL('three');

-- Attacher une table à une séquence
CREATE TABLE oder_details
(
	order_id SERIAL,
	item_id INT NOT NULL,
	product_id VARCHAR(255) NOT NULL,
	price DEC(10 , 2) NOT NULL,
	PRIMARY KEY(order_id , item_id)
);
CREATE SEQUENCE oder_item_id
START 10
INCREMENT 10
MINVALUE 10
OWNED BY order_details.item_id; -- Détenu par
-- Que fait l'insertion de données
INSERT INTO order_details(order_id , item_id , product_id , price)
	VALUES
		(100, NEXTVAL('oder_item_id') , 'DVD Player' , 100), -- 10
		(100, NEXTVAL('oder_item_id') , 'Android TV' , 550), -- 20
		(100, NEXTVAL('oder_item_id') , 'Specker' , 250);    -- 30
SELECT * FROM order_details;

-- Lié la séquence à une deuxième table
CREATE TABLE order_details_2
(
	order_id SERIAL,
	item_id INT NOT NULL,
	product_id VARCHAR(255),
	price DEC(10,2) NOT NULL,
	PRIMARY KEY(order_id , item_id)
);
INSERT INTO order_details_2(order_id , item_id , product_id , price)
	VALUES
		(100, NEXTVAL('oder_item_id') , 'DVD Player' , 100), -- 40
		(100, NEXTVAL('oder_item_id') , 'Android TV' , 550), -- 50
		(100, NEXTVAL('oder_item_id') , 'Specker' , 250);    -- 60


-- Modifier la séquence
ALTER SEQUENCE IF EXISTS order_item_id
INCREMENT 10;
SELECT NEXTVAL('order_item_id'); -- 70

-- Redémarrer la séquence à 10
ALTER SEQUENCE IF EXISTS order_item_id
RESTART 10;
SELECT NEXTVAL('order_item_id');  -- 10


CREATE SEQUENCE order_max
START 1
INCREMENT 1
MAXVALUE 2
OWNED BY order_details.item_id;
INSERT INTO order_details(order_id , item_id , product_id , price)
	VALUES
		(100, NEXTVAL('order_item_id') , 'DVD Player' , 100),
		(100, NEXTVAL('order_item_id') , 'Android TV' , 550),
		(100, NEXTVAL('order_item_id') , 'Specker' , 250); -- Valeur maximal de la séquence "order_max" (2) atteinte
```