# **Insérer les données** <a href="../../"> <img src="https://upload.wikimedia.org/wikipedia/commons/2/29/Postgresql_elephant.svg" alt="PostgreSQL" align="right" height="64px"> </a>

## **Syntaxe**
```sql
-- Insert la ligne dnas 'ma_table' ayant la valeur ('Olivier')
INSERT INTO ma_table VALUES ('Olivier');
INSERT INTO people VALUES ('MOI' , 'MOI')
INSERT INTO people VALUES ('LE ROI LION' , 'SYMBA') , ('TIMON' , 'PUMBA'); 
```

___
>>>NOTA :  
Pour les insertions `INTO` & `VALUES` est obligatoires
Si les données insérées ne sont pas comprises dans les guillements simples elles sont comfondues en nom de colonnes.