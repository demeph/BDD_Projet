drop role lesClients;
create role lesClients;

grant select on Film to lesClients;
grant select on Seance to lesClients;
grant select on Cinema to lesClients;
grant select on Casting to lesClients;
grant select on Realisateur to lesClients;
grant select on Acteur to lesClients;

drop role lesGuichetiers;
create role lesGuichetiers;

grant select,insert,update on Reservation to lesGuichetiers;
grant select,insert,update on Client to lesGuichetiers;
grant select on Seance to lesGuichetiers;

drop role lesGerantsFilm;
create role lesGerantsFilm;

grant select on Film to lesGerantsFilm;
grant select on Salle to lesGerantsFilm;
grant select,insert,update,delete on Seance to lesGerantsFilm;

grant lesClients to L3_33;
grant lesGuichetiers to L3_30;
grant lesGerantsFilm to L3_9;
