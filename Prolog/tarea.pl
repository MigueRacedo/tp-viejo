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
director(jamesCameron).

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

estreno(inception, 2010).
estreno(guardianesDeLaGalaxia, 2014).
estreno(2012, 2009).
estreno(titanic, 1997).

tieneCarrera(Persona) :- actor(Persona), actuoEn(Pelicula, Persona), estreno(Pelicula, Anio <2000).
tieneCarrera(Persona) :- actriz(Persona), actuoEn(Pelicula, Persona), estreno(Pelicula, Anio <2000).
tieneCarrera(Persona) :- director(Persona), dirigio(Persona, Pelicula), estreno(Pelicula, Anio <2000).

hayQuimica(Persona, OtraPersona) :- actor(Persona), actriz(OtraPersona), actuoEn(Pelicula, Persona), actuoEn(Pelicula, OtraPersona).
hayQuimica(Persona, OtraPersona) :- actor(OtraPersona), actriz(Persona), actuoEn(Pelicula, Persona), actuoEn(Pelicula, OtraPersona).