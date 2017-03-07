CREATE OR REPLACE PROCEDURE afficher_places_restantes(id_seance IN integer) 
IS
res_std integer;
res_handi integer;
res_dbox integer;
capacite_std integer;
capacite_handi integer;
capacite_dbox integer;
BEGIN
SELECT sum(nbPlaceStandardRes) INTO res_std,
       sum(nbPlaceHandicapeRes) INTO res_handi,
       sum(nbPlaceDboxRes) INTO res_dbox
FROM Reservation
WHERE idSeance = id_seance;
        
SELECT nbPlaceStandard INTO capacite_std,
       nbPlaceHandicape INTO capacite_handi,
       nbPlaceDbox INTO capacite_dbox
FROM Salle
WHERE numSalle = SELECT numSalle
                 FROM Seance
                 WHERE idSeance = id_seance;
DBMS_OUTPUT.PUT_LINE('places restantes :\n\t-'
                    || capacite_std - res_std
                    || 'places standard\n\t-'
                    || capacite_handi - res_handi
                    || 'places handicapée\n\t-'
                    || capacite_dbox - res_dbox);
END;
/   
