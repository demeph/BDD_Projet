DROP VIEW seanceDisponible;

CREATE VIEW seanceDisponible AS
SELECT nomFilm, dateProjection, franchise, numSalle
FROM Seance NATURAL JOIN Film NATURAL JOIN Cinema NATURAL JOIN Salle
WHERE dateProjection >= (SELECT sysdate FROM dual)
      AND
      (nbPlaceHandicape + nbPlaceStandard + nbPlaceDbox) > (SELECT SUM(nbPlaceHandicapeRes + nbPlaceStandardRes + nbPlaceDboxRes) 
							    FROM Reservation NATURAL JOIN Seance
							    WHERE dateProjection >= (SELECT sysdate FROM dual)
							    GROUP BY idSeance)
GROUP BY nomFilm, dateProjection, franchise, numSalle;
       

