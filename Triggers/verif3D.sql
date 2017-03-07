CREATE OR REPLACE TRIGGER verif3D
BEFORE INSERT or UPDATE on Seance
FOR EACH ROW
Declare
	salleEn3D Salle.salleCompatible3D%type;
	salle_incompatible3D exception;
BEGIN
	if inserting or updating then
		if :new.diffusionEn3D != 0 then
			select distinct salleCompatible3D into salleEn3D 
			from salle s
			where s.idCine = :new.idCine and s.numSalle = :new.numsalle;
			if salleEn3D != 1 then 
				raise salle_incompatible3D;
			end if;
		end if;
	end if;
EXCEPTION 
	when  salle_incompatible3D then
		raise_application_error(-20007,'la salle doit être compatible en 3D');
END;
/
