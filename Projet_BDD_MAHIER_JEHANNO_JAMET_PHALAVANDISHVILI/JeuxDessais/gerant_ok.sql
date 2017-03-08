----------------
-- table Film --
----------------

SELECT * FROM L3_35.Film
WHERE idFilm = 1;

-----------------
-- table Salle --
-----------------

SELECT * FROM L3_35.Salle
WHERE idCine = 1;

------------------
-- table Seance --
------------------

INSERT INTO L3_35.Seance Values (5555, 1, 1, to_date('03/03/2018 23:59', 'DD/MM/YYYY HH24:MI'), 7, 0);

UPDATE L3_35.Seance SET dateProjection = to_date('03/03/2017 22:00', 'DD/MM/YYYY HH24:MI') WHERE idSeance = 5555;

SELECT * FROM L3_35.Seance WHERE idSeance = 5555;

DELETE FROM L3_35.Seance WHERE idSeance = 5555;
