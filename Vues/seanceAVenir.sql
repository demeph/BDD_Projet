DROP VIEW seanceAVenir;

CREATE VIEW seanceAVenir AS
SELECT *
FROM Seance
WHERE dateProjection >= (SELECT sysdate FROM dual);
