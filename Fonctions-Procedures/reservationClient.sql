CREATE OR REPLACE PROCEDURE reservationClient(nom IN VARCHAR, prenom IN VARCHAR, idSeanceNew IN INTEGER, nbPlaceHandicape IN INTEGER, nbPlaceStandard IN INTEGER, nbPlaceDBox IN INTEGER)
IS
prochainNumResa Reservation.numReservation %type;
seanceExist INTEGER;
clientExist INTEGER;
newIdClient Reservation.idClient %type;
seancePasse EXCEPTION;
BEGIN
SELECT COUNT(*)INTO seanceExist FROM SeanceAVenir WHERE idSeanceNew = idSeance;
IF seanceExist > 0 THEN
	SELECT MAX(numReservation) INTO prochainNumResa
	FROM Reservation;
	SELECT COUNT(*)INTO clientExist FROM Client WHERE nom = nomC AND prenom = prenomC;
	IF clientExist > 0 THEN 
	SELECT idClient INTO newIdClient FROM Client WHERE nom = nomC AND prenom = prenomC;
	INSERT INTO Reservation VALUES (newIdClient, idSeanceNew, numReserv_seq.nextval, nbPlaceHandicape, nbPlaceStandard, nbPlaceDBox);
	ELSE 
		INSERT INTO Client VALUES (clients_seq.nextval, nom, prenom);
		INSERT INTO Reservation VALUES (clients_seq.currval, idSeanceNew, numReserv_seq.nextval, nbPlaceHandicape, nbPlaceStandard, nbPlaceDBox);
	END IF;
ELSE
	RAISE seancePasse;
END IF;
EXCEPTION
WHEN seancePasse THEN RAISE_APPLICATION_ERROR(-20001, 'Vous essayez de reserver une seance passee');
END;
/
show error;

