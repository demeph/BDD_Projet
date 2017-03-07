DECLARE 
	i integer;
BEGIN
	For i in 1..70 LOOP
		execute reservationClient('Martin'||i,'paul'||i,4,1,1,1);	 
	END LOOP;
END;	
/