# **La cascade d’intégrité référentielle**
C’est un concept clé dans la gestion des bases de données relationnelles. Elle garantit que les relations entre les tables restent cohérentes lorsqu’il y a des modifications (insertion, mise à jour, suppression) des données. Voici les principaux types de cascades d’intégrité référentielle :

1. **CASCADE** : Cette option indique que lorsqu’une ligne dans la table parent est supprimée ou mise à jour, les lignes correspondantes dans la table enfant doivent également être supprimées ou mises à jour. Cela garantit que les données orphelines ne sont pas laissées dans la table enfant.
   
2. **SET NULL** : Lorsque la ligne parent est supprimée ou mise à jour, les clés étrangères correspondantes dans la table enfant sont définies sur NULL. Cela nécessite que les colonnes de clé étrangère dans la table enfant acceptent les valeurs NULL.

3. **SET DEFAULT** : Quand une ligne dans la table parent est supprimée ou mise à jour, les clés étrangères dans la table enfant sont définies sur une valeur par défaut spécifiée. Cette option est moins courante et nécessite que les colonnes de clé étrangère aient une valeur par défaut définie.

4. **NO ACTION** : Cette option empêche toute action si elle viole l’intégrité référentielle. En d’autres termes, si une tentative de suppression ou de mise à jour de la ligne parent laisserait des orphelins dans la table enfant, l’opération est annulée.

5. **RESTRICT** : Similaire à NO ACTION, RESTRICT interdit la suppression ou la mise à jour d’une ligne parent si des lignes correspondantes existent dans la table enfant. La différence principale est que RESTRICT applique immédiatement la vérification d’intégrité référentielle, alors que NO ACTION peut différer la vérification jusqu’à la fin de la transaction.

### Exemple Pratique

Supposons que nous ayons deux tables : `Orders` (commandes) et `OrderDetails` (détails des commandes). La table `Orders` contient une clé primaire `OrderID`, et `OrderDetails` contient une clé étrangère `OrderID` référencée à `Orders`.

1. **Déclaration des tables avec CASCADE** :

```sql
CREATE TABLE Orders (
    OrderID int PRIMARY KEY,
    OrderDate date
);

CREATE TABLE OrderDetails (
    DetailID int PRIMARY KEY,
    OrderID int,
    ProductID int,
    Quantity int,
    FOREIGN KEY (OrderID) REFERENCES Orders(OrderID) ON DELETE CASCADE ON UPDATE CASCADE
);
```

2. **Insertion de données** :

```sql
INSERT INTO Orders (OrderID, OrderDate) VALUES (1, '2023-06-01');
INSERT INTO OrderDetails (DetailID, OrderID, ProductID, Quantity) VALUES (1, 1, 101, 5);
INSERT INTO OrderDetails (DetailID, OrderID, ProductID, Quantity) VALUES (2, 1, 102, 2);
```

3. **Suppression d’une commande** :

```sql
DELETE FROM Orders WHERE OrderID = 1;
```

En utilisant `ON DELETE CASCADE`, la suppression de la ligne dans `Orders` entraînera automatiquement la suppression des lignes correspondantes dans `OrderDetails`.

La cascade d’intégrité référentielle simplifie la gestion des relations entre les tables et assure que les données restent cohérentes et intègres tout au long des opérations sur la base de données.