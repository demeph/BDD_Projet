DROP VIEW seanceDisponible;

CREATE VIEW seanceDisponible AS
SELECT idSeance
FROM Seance NATURAL JOIN Salle
WHERE dateProjection >= (SELECT sysdate FROM dual)
      AND
      (nbPlaceHandicape + nbPlaceStandard + nbPlaceDbox) > (SELECT SUM(nbPlaceHandicapeRes + nbPlaceStandardRes + nbPlaceDboxRes) 
							    FROM Reservation NATURAL JOIN Seance
							    WHERE dateProjection >= (SELECT sysdate FROM dual)
							    GROUP BY idSeance)
GROUP BY idSeance;
       

