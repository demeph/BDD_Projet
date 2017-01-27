# Dependences fonctionnelles

- $adresse, ville \rightarrow franchise, nbsalle$
- $adresse, ville, numSalle \rightarrow SallecompatibleEn3D, nbPlaceStandard, nbPlaceHandicape,nbDbox$ 
- $nomFilm, dateSortie \rightarrow public, idPers AS idReal, durée, compatible3D$
- $nomfilm, dateSortie, role \rightarrow idPers$
- $adresse, ville, horaire, date_projection, numSalle \rightarrow nomFilm, dateSortie, diffusionen3D $
- $horaire, nomfilm, adresse, ville \rightarrow  numsalle$ 

- $idCine \right​arrow adresse, ville$
- $idFilm \rightarrow nomFilm, dateSortie$
- $idPers \rightarrow nom, prenom$
- $idPers, idFilm \rightarrow role$
- $idCine \rightarrow nbSalles$
- $idSeance \rightarrow adresse, ville, horaire, dateSortie, numSalle$


___________________________________________________________

1ere DF :

{adresse}+={adresse}
{ville}+={ville}
--> nécéssaire

2eme DF :

{adresse}+={adresse}
{ville}+={ville}
{numSalle}+={numSalle}
--> nécéssaire

3eme DF :

{nomFilm}+={nomFilm}
{dateSortie}+={dateSortie}
--> nécéssaire

4eme DF :

{nomFilm}+={nomFilm}
{dateSortie}+={dateSortie}
{role}+={role}
--> nécéssaire

5eme DF :

{adresse}+={adresse}
{ville}+={ville}
{horaire}+={horaire}
{date_projection}+={date_projection}
{numSalle}+={numSalle}
--> nécéssaire
