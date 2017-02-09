CREATE OR REPLACE TRIGGER verifPlaceRes
BEFORE INSERT on Reservation
FOR EACH ROW
DECLARE
	nbPlaceDispo salle.nbPlaceStandard%type;
	nbPlaceHandDispo salle.nbPlaceHandicape%type;
	nbPlaceDBoxDispo salle.nbPlacedBow%type;
	nbPlaceDispoCine salle.nbPlaceStandard%type;
	nbPlaceHandDispoCine salle.nbPlaceHandicape%type;
	nbPlaceDBoxDispoCine salle.nbPlaceStandard%type;
	pas_assez_Place exception;
BEGIN
	SELECT sum(nbPlaceStandardRes) into nbPlaceDispo
	FROM Reservation 
	where :new.idSeance = idSeance;
	SELECT sum(nbPlaceHandicapeRes) into nbPlaceHandDispo
	FROM Reservation 
	where :new.idSeance = idSeance;
	SELECT sum(nbPlacedBoxRes) into nbPlaceDBoxDispo
	FROM Reservation 
	where :new.idSeance = idSeance;

	SELECT sum(nbPlaceStandard) into nbPlaceDispoCine
	FROM Reservation 
	where :new.idSeance = idSeance;
	SELECT sum(nbPlaceHandicape) into nbPlaceHandDispoC
	FROM Reservation 
	where :new.idSeance = idSeance;
	SELECT sum(nbPlacedBoxRes) into nbPlaceDBoxDispo
	FROM Reservation 
	where :new.idSeance = idSeance;
END;
/