 CREATE OR REPLACE TRIGGER verifPlaceRes
BEFORE INSERT on Reservation
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

	SELECT sa.nbPlaceStandard into nbPlaceDispoCine
	FROM (Reservation r join seance s on r.idSeance = s.idSeance) join Salle sa on sa.idCine = s.idCine
	where r.idSeance = :new.idSeance;
	SELECT sa.nbPlaceHandicape into nbPlaceHandDispoCine
	FROM (Reservation r join seance s on r.idSeance = s.idSeance) join Salle sa on sa.idCine = s.idCine
	where r.idSeance = :new.idSeance;
	SELECT sa.nbPlaceDbox into nbPlaceDBoxDispoCine
	FROM (Reservation r join seance s on r.idSeance = s.idSeance) join Salle sa on sa.idCine = s.idCine
	where r.idSeance = :new.idSeance;

	if (nbPlaceOcc + :new.nbPlaceStandardRes > nbPlaceDispoCine) then
		raise pas_assez_Place;
	end if;
	if (nbPlaceHandOcc + :new.nbPlaceHandicapeRes > nbPlaceHandDispoCine) then
		raise pas_assez_Place_Hand;
	end if;
	if (nbPlaceDBoxOcc + :new.nbPlacedboxRes > nbPlaceDBoxDispoCine) then
		raise pas_assez_Place_dBox;
	end if;
Exception
	when pas_assez_Place then
		DBMS_OUTPUT.PUT_LINE('pas assez place standard');
	/*when pas_assez_Place_Hand then
		DBMS_OUTPUT.PUT_LINE('pas assez place handicape');
	when pas_assez_Place_dBox then
		DBMS_OUTPUT.PUT_LINE('pas assez place dBox');*/
END;
/
show error;