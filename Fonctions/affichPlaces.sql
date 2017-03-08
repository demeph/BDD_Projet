set serveroutput on;
CREATE OR REPLACE PROCEDURE affichPlaces(id_seance IN INTEGER) 
IS
res_std INTEGER;
res_handi INTEGER;
res_dbox INTEGER;
capacite_std INTEGER;
capacite_handi INTEGER;
capacite_dbox INTEGER;
nb_seances INTEGER;
seanceInexistante EXCEPTION;
BEGIN
SELECT COUNT(*) INTO nb_seances FROM Seance WHERE idSeance = id_seance;
IF nb_seances > 0 THEN
   SELECT SUM(nbPlaceStandardRes) INTO res_std
   FROM Reservation
   WHERE idSeance = id_seance;
   SELECT SUM(nbPlaceHandicapeRes) Into res_handi
   FROM Reservation
   WHERE idSeance = id_seance;
   SELECT SUM(nbPlaceDboxRes) INTO res_dbox
   FROM Reservation
   WHERE idSeance = id_seance;
   SELECT nbPlaceStandard INTO capacite_std
   FROM Salle
   WHERE numSalle = (SELECT numSalle
                     FROM Seance
                     WHERE idSeance = id_seance);
   SELECT nbPlaceHandicape INTO capacite_handi
   FROM Salle
   WHERE numSalle = (SELECT numSalle
                     FROM Seance
                     WHERE idSeance = id_seance);
   SELECT nbPlaceDbox INTO capacite_dbox
   FROM Salle
   WHERE numSalle = (SELECT numSalle
                     FROM Seance
                     WHERE idSeance = id_seance);
   DBMS_OUTPUT.PUT_LINE('places restantes : '
                     || TO_CHAR(capacite_std - res_std)
                     || ' places standard, '
                     || TO_CHAR(capacite_handi - res_handi)
                     || ' places handicapee, '
                     || TO_CHAR(capacite_dbox - res_dbox) || ' places dbox' || '');
ELSE
   RAISE seanceInexistante;
END IF;
EXCEPTION
WHEN seanceInexistante THEN RAISE_APPLICATION_ERROR(-20001, 'La seance ' || TO_CHAR(id_seance) || ' n''existe pas');
END;
/

show errors;
set serveroutput off;
