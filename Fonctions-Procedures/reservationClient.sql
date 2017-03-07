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
	INSERT INTO Reservation VALUES (newIdClient, idSeanceNew, prochainNumResa+1, nbPlaceHandicape, nbPlaceStandard, nbPlaceDBox);
	ELSE 
		INSERT INTO Client VALUES (clients_seq.nextval, nom, prenom);
		INSERT INTO Reservation VALUES (clients_seq.currval, idSeanceNew, prochainNumResa+1, nbPlaceHandicape, nbPlaceStandard, nbPlaceDBox);
	END IF;
ELSE
	RAISE seancePasse;
END IF;
EXCEPTION
WHEN seancePasse THEN RAISE_APPLICATION_ERROR(-20001, 'Vous essayez de reserver une seance passee');
END;
/

-- exec reservationClient('Martin', 'Jean', 1, 0, 2, 0);
-- exec reservationClient('Dupont', 'Marc', 1, 0, 2, 0);
-- exec reservationClient('Piere', 'Jean', 3, 1, 1, 1); 

