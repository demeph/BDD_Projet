CREATE OR REPLACE PROCEDURE afficher_places_restantes(id_seance IN INTEGER) 
IS
res_std INTEGER;
res_handi INTEGER;
res_dbox INTEGER;
capacite_std INTEGER;
capacite_handi INTEGER;
capacite_dbox INTEGER;
BEGIN
SELECT SUM(nbPlaceStandardRes) INTO res_std,
       SUM(nbPlaceHandicapeRes) INTO res_handi,
       SUM(nbPlaceDboxRes) INTO res_dbox
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
                    || capacite_dbox - res_dbox
                    || 'places dbox');
END;
/
        
exec afficher_places_restantes(1);
exec afficher_places_restantes(2);
