----------------
-- table Film --
----------------

INSERT INTO L3_35.Film Values (77, 'lotr', to_date('24/12/2001', 'DD/MM/YYYY'), '-10', 320, 1, 0);

-----------------
-- table Salle --
-----------------

DELETE FROM L3_35.Salle
WHERE idCine = 1;

------------------
-- table Cinema --
------------------

SELECT * FROM L3_35.Cinema
WHERE idCine = 1;

-------------------
-- table Clients --
-------------------

UPDATE L3_35.Client
SET nomC = 'henry'
WHERE idClient = 1;
