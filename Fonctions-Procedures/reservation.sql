DROP PROCEDURE reservation;

CREATE OR REPLACE PROCEDURE reservation(idSeanceNEW INTEGER, nbPlaceHandicape INTEGER, nbPlaceStandard INTEGER, nbPlaceDBox INTEGER)
IS
prochainIdClient Reservation.idClient %type;
prochainNumResa Reservation.numReservation %type;
compteur INTEGER;
seancePasse EXCEPTION;
BEGIN

select MAX(idClient) INTO prochainIdClient
from Reservation;
select MAX(numReservation) INTO prochainNumResa
from Reservation;

select count(*)INTO compteur from SeanceAVenir WHERE idSeanceNEW=idSeance;

IF Compteur > 0 THEN
INSERT INTO Reservation Values (prochainIdClient+1, idSeance, prochainNumResa+1, nbPlaceHandicape, nbPlaceStandard, nbPlaceDBox);
ELSE 
RAISE seancePasse;
END IF;

EXCEPTION
WHEN seancePasse THEN RAISE_APPLICATION_ERROR(-20001, 'Vous essayez de reserver une seance passee');


END reservation;
