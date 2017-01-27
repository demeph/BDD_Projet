# Dependences fonctionnelles

- $adresse, ville \rightarrow franchise, nbsalle$
- $adresse, ville, numSalle \rightarrow SallecompatibleEn3D, nbPlaceStandard, nbPlaceHandicape,nbDbox$ 
- $nomFilm, dateSortie \rightarrow public, idPers AS idReal, durée, compatible3D$
- $nomfilm, dateSortie, role \rightarrow idPers$
- $adresse, ville, horaire, date, numSalle \rightarrow nomFilm, dateSortie, diffusionen3D $
- $nomC, prenomC, numRes \rightarrow nbPlaceStandardRes, nbPlaceHandicapeRes, \\ nbDboxRes, nomfilm, adresse, ville, salle, horaire$ 
- $horaire, nomfilm, adresse, ville \rightarrow  numsalle$ 

- $idCine \right​arrow adresse, ville$
- $idFilm \rightarrow nomFilm, dateSortie$
- $idPers \rightarrow nom, prenom$
- $idPers, idFilm \rightarrow role$
- $idCine \rightarrow nbSalles$
- $idClient \rightarrow nomC, prenomC$
- $idSeance \rightarrow adresse, ville, horaire, dateSortie, numSalle$


___________________________________________________________

1ere DF :

{adresse}+={adresse}
{ville}+={ville}
--> adresse, ville  nécéssaire

2eme DF :

{adresse}+={adresse}
{ville}+={ville}



 