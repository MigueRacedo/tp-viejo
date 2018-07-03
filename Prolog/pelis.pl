pelicula(elPadrino).
pelicula(juegoDeGemelas).
pelicula(pulpFiction).
pelicula(titanic).
pelicula(elHijoDeLaNovia).
pelicula(toyStory).
pelicula(inception).
pelicula(guardianesDeLaGalaxia).
pelicula(2012).

actor(leonardoDicrapio).
actor(samuelJackson).
actor(ricardoDarin).

actriz(lindsayLohan).
actriz(normaAleandro).

director(stevenSpielberg).
director(gasparNoe).
director(juanJoseCampanella).
director(quentinTarantino).
director(leonardoDicrapio).

viveDelCine(Persona) :- actor(Persona).
viveDelCine(Persona) :- director(Persona).
viveDelCine(Persona) :- actriz(Persona).

dirigio(quentinTarantino, pulpFiction).
dirigio(juanJoseCampanella, elHijoDeLaNovia).
dirigio(jamesCameron, titanic).

actuoEn(inception, leonardoDicrapio).
actuoEn(elHijoDeLaNovia, normaAleandro).
actuoEn(pulpFiction, samuelJackson).

actuoEn(titanic, leonardoDicrapio, 1997).

loDirigio(Director, Actor) :-
    actuoEn(Pelicula, Actor),
    dirigio(Director, Pelicula).

loDirigio(Director, Actor) :-
    actuoEn(Pelicula, Actor, Anio),
    dirigio(Director, Pelicula).
    

estreno(elPadrino, 1972).
estreno(juegoDeGemelas, 1999).
estreno(pulpFiction, 1994).
estreno(titanic, 1997).
estreno(elHijoDeLaNovia, 2001).
estreno(toyStory, 1995).
estreno(inception, 2010).
estreno(guardianesDeLaGalaxia, 2014).
estreno(2012, 2009).
    
tieneCarrera(Actor) :-
    actuoEn(Pelicula, Actor),
    esNueva(Pelicula).
    
tieneCarrera(Director) :-
    dirigio(Director, Pelicula),
    esNueva(Pelicula).
 
esNueva(Pelicula):-
    estreno(Pelicula, Anio),
    Anio > 2000.

hayQuimica(Actor, Actriz) :-
    actor(Actor),
    actriz(actriz),
    actuaronJuntos(Actor, Actriz, Pelicula),
    actuaronJuntos(Actor, Actriz, OtraPelicula),
    Pelicula \= OtraPelicula.
    
actuaronJuntos(Actor, Actriz, Pelicula) :-
    actuoEn(Pelicula, Actor),
    actuoEn(Pelicula, Actriz).

ganoPremio(elPadrino).
ganoPremio(pulpFiction).
ganoPremio(titanic).
ganoPremio(toyStory).
ganoPremio(inception).

genero(laMasacreDeTexas, terror(12)).
genero(scream, terror(6)).
genero(titanic, drama(10)).
genero(elHijoDeLaNovia, drama(300)).
genero(toyStory, infantil(animada, 81)).
genero(juegoDeGemelas, infantil(carneYHueso, 123)).
genero(inception, cienciaFiccion(0)).

%% terror(CantidadDeVictimas).
%% infantil(SiEsAnimadaONo, Duracion).
%% comedia(Subgenero, CantidadDeCliches).
%% drama(MLDeLagrimas).
%% cienciaFiccion(CantDeVecesQueUsanLaPalabraCuantico).

estaBuena(Pelicula) :-
   genero(Pelicula, drama(MLDeLagrimas)),
   MLDeLagrimas > 15.
 
estaBuena(Pelicula) :-
   genero(Pelicula, infantil(carneYHueso, Duracion)),
   Duracion > 80.
 
estaBuena(Pelicula) :-
   genero(Pelicula, infantil(animada, Duracion)),
   Duracion < 90.
 
 
estaBuena(Pelicula) :-
   genero(Pelicula, terror(CantidadDeVictimas)),
   CantidadDeVictimas > 10.
 
estaBuena(Pelicula) :- genero(Pelicula, cienciaFiccion(_)).
