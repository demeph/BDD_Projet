CREATE OR REPLACE PROCEDURE reservationClient(idSeanceNew IN INTEGER, nbPlaceHandicape IN INTEGER, nbPlaceStandard IN INTEGER, nbPlaceDBox IN INTEGER)
IS
prochainIdClient Reservation.idClient %type;
prochainNumResa Reservation.numReservation %type;
compteur INTEGER;
seancePasse EXCEPTION;
BEGIN
SELECT MAX(idClient) INTO prochainIdClient
FROM Reservation;
SELECT MAX(numReservation) INTO prochainNumResa
FROM Reservation;
SELECT count(*)INTO compteur FROM SeanceAVenir WHERE idSeanceNew=idSeance;
IF Compteur > 0 THEN
INSERT INTO Reservation VALUES (prochainIdClient+1, idSeance, prochainNumResa+1, nbPlaceHandicape, nbPlaceStandard, nbPlaceDBox);
ELSE 
RAISE seancePasse;
END IF;
EXCEPTION
WHEN seancePasse THEN RAISE_APPLICATION_ERROR(-20001, 'Vous essayez de reserver une seance passee');
END;
/
