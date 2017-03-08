------------------
-- table Seance --
------------------

UPDATE L3_35.Seance
SET numSalle = 1
WHERE idSeance = 1;

------------------
-- table Acteur --
------------------

INSERT INTO L3_35.Acteur Values (7777, 'mortensen', 'viggo');

SELECT * FROM L3_35.Acteur
WHERE idAct = 1;

DELETE L3_35.Acteur
WHERE idAct = 1;

