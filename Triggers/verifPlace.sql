CREATE OR REPLACE TRIGGER verifPlaceRes
BEFORE INSERT on Reservation
FOR EACH ROW
DECLARE
	nbPlaceOcc salle.nbPlaceStandard%type;
	nbPlaceHandOcc salle.nbPlaceHandicape%type;
	nbPlaceDBoxOcc salle.nbPlacedBow%type;
	nbPlaceDispoCine salle.nbPlaceStandard%type;
	nbPlaceHandDispoCine salle.nbPlaceHandicape%type;
	nbPlaceDBoxDispoCine salle.nbPlaceStandard%type;
	pas_assez_Place exception;
	pas_assez_Place_Hand exception;
	pas_assez_Place_dBox exception;
BEGIN
	SELECT sum(nbPlaceStandardRes) into nbPlaceOcc
	FROM Reservation 
	where :new.idSeance = idSeance;
	SELECT sum(nbPlaceHandicapeRes) into nbPlaceHandOcc
	FROM Reservation 
	where :new.idSeance = idSeance;
	SELECT sum(nbPlacedBoxRes) into nbPlaceDBoxOcc
	FROM Reservation 
	where :new.idSeance = idSeance;

	SELECT nbPlaceStandard into nbPlaceCine
	FROM (Reservation r join seance s on r.idSeance = s.idSeance) join Cinema c on c.idCine = s.idCine
	where :new.idSeance = idSeance;
	SELECT nbPlaceHandicape into nbPlaceHandCine
	FROM (Reservation r join seance s on r.idSeance = s.idSeance) join Cinema c on c.idCine = s.idCine
	where :new.idSeance = idSeance;
	SELECT nbPlacedBoxRes into nbPlaceDBoxCine
	FROM (Reservation r join seance s on r.idSeance = s.idSeance) join Cinema c on c.idCine = s.idCine
	where :new.idSeance = idSeance;

	if nbPlaceOcc + :new.nbPlaceStandardRes > nbPlaceCine then
		raise pas_assez_Place;
	else if nbPlaceHandOcc + :new.nbPlaceHandicapeRes > nbPlaceHandCine then
		raise pas_assez_Place_Hand;
	else if nbPlaceDBoxOcc + :new.nbPlacedboxRes > nbPlaceDBoxCine then
		raise pas_assez_Place_dBox;
	end if;
exception
	when pas_assez_Place then
		DBMS_OUTPUT.PUT_LINE('pas assez place standard');
	when pas_assez_Place_Hand then
		DBMS_OUTPUT.PUT_LINE('pas assez place handicape');
	when pas_assez_Place_dBox then
		DBMS_OUTPUT.PUT_LINE('pas assez place dBox');
END;
/