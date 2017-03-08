------------------
-- table Client --
------------------

INSERT INTO L3_35.Client Values (7777, 'telcontar', 'elessar');

UPDATE L3_35.Client
SET prenomC = 'aragorn'
WHERE idClient = 7777;

SELECT * FROM L3_35.Client
WHERE idClient = 7777;

-----------------------
-- table Reservation --
-----------------------

INSERT INTO L3_35.Reservation Values (1, 2, 7777, 1, 0, 0);

UPDATE L3_35.Reservation
SET nbPlaceHandicapeRes = 2
WHERE numReservation = 7777;

SELECT * FROM L3_35.Reservation
WHERE numReservation = 7777;

DELETE FROM L3_35.Reservation
WHERE numReservation = 7777;

------------------
-- table Seance --
------------------

SELECT * FROM Seance
WHERE idSeance = 1;
