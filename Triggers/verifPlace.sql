set serveroutput on
CREATE OR REPLACE TRIGGER verifPlaceRes
BEFORE INSERT or update on Reservation
FOR EACH ROW
DECLARE
	nbPlaceOcc salle.nbPlaceStandard%type;
	nbPlaceHandOcc salle.nbPlaceHandicape%type;
	nbPlaceDBoxOcc salle.nbPlacedBox%type;
	nbPlaceDispoCine salle.nbPlaceStandard%type;
	nbPlaceHandDispoCine salle.nbPlaceHandicape%type;
	nbPlaceDBoxDispoCine salle.nbPlaceStandard%type;
	pas_assez_Place exception;
	pas_assez_Place_Hand exception;
	pas_assez_Place_dBox exception;
BEGIN
	SELECT sum(nbPlaceStandardRes) into nbPlaceOcc
	FROM Reservation 
	where idSeance = :new.idSeance;
	SELECT sum(nbPlaceHandicapeRes) into nbPlaceHandOcc
	FROM Reservation 
	where idSeance = :new.idSeance;
	SELECT sum(nbPlacedBoxRes) into nbPlaceDBoxOcc
	FROM Reservation 
	where idSeance = :new.idSeance;

	SELECT nbPlaceStandard into nbPlaceDispoCine
	FROM Salle
	where numSalle = ( select numSalle from Seance where idSeance = :new.idSeance);
	SELECT nbPlaceHandicape into nbPlaceHandDispoCine
	FROM Salle
	where numSalle = ( select numSalle from Seance where idSeance = :new.idSeance);
	SELECT nbPlaceDbox into nbPlaceDBoxDispoCine
	FROM Salle
	where numSalle = ( select numSalle from Seance where idSeance = :new.idSeance);

	if (nbPlaceOcc + :new.nbPlaceStandardRes) > nbPlaceDispoCine then
		raise pas_assez_Place;
	end if;
	if (nbPlaceHandOcc + :new.nbPlaceHandicapeRes) > nbPlaceHandDispoCine then
		raise pas_assez_Place_Hand;
	end if;
	if (nbPlaceDBoxOcc + :new.nbPlacedboxRes) > nbPlaceDBoxDispoCine then
		raise pas_assez_Place_dBox;
	end if;
Exception
	when pas_assez_Place then
		RAISE_APPLICATION_ERROR(-20002, 'pas assez place standard');
		--DBMS_OUTPUT.PUT_LINE('pas assez place standard');
	when pas_assez_Place_Hand then
		RAISE_APPLICATION_ERROR(-20004, 'pas assez place handicape');
		--DBMS_OUTPUT.PUT_LINE('pas assez place handicape');
	when pas_assez_Place_dBox then
		RAISE_APPLICATION_ERROR(-20005, 'pas assez place dBOX');
		/*DBMS_OUTPUT.PUT_LINE('pas assez place dBox');*/
END;
/
show error;