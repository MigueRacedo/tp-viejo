module Karrrs where

import Text.Show.Functions
import Data.List

data Auto = UnAuto {nombre::String,nafta::Int,velocidad::Int,enamorado::String,truco::Truco} deriving(Show)
data Carrera = UnaCarrera {vueltas::Int,longitud::Int,participantes::[Auto],publico::[String]} deriving(Show)

type Truco = Auto -> Auto

rochaMcQueen = UnAuto {
	nombre = "RochaMcQueen",
	nafta = 282,
	velocidad = 4,
	enamorado = "Ronco",
	truco = deReversaRocha grandPrix
}

biankerr = UnAuto {
	nombre = "Biankerr",
	nafta = 378,
	velocidad = 3,
	enamorado = "Tincho",
	truco = impresionar grandPrix
}

gushtav = UnAuto {
	nombre = "Gushtav",
	nafta = 230,
	velocidad = 2,
	enamorado = "Pet",
	truco = nitro
}

rodra = UnAuto {
	nombre = "Rodra",
	nafta = 153,
	velocidad = 1,
	enamorado = "Tais",
	truco = comboLoco grandPrix
}

grandPrix = UnaCarrera {
	vueltas = 3,
	longitud = 4304,
	participantes = [rochaMcQueen,biankerr,gushtav,rodra],
	publico = ["Tincho","Mili","Mitre","Pet","Tais"]
}

deReversaRocha :: Carrera -> Truco
deReversaRocha carrera auto = aumentarNaftaEn (((*5).longitud) carrera) auto

impresionar :: Carrera -> Truco
impresionar carrera auto
	| estaSuEnamorado carrera auto = aumentarVelocidadEn (2 * (velocidad auto)) auto
	| otherwise = auto

nitro :: Truco
nitro auto = aumentarVelocidadEn 15 auto

comboLoco :: Carrera -> Truco
comboLoco carrera auto = (deReversaRocha carrera.nitro) auto

aumentarNaftaEn :: Int -> Auto -> Auto
aumentarNaftaEn cantidad auto = auto {nafta = ((+cantidad).nafta) auto}

aumentarVelocidadEn :: Int -> Auto -> Auto
aumentarVelocidadEn cantidad auto = auto {velocidad = ((+cantidad).velocidad) auto}

estaSuEnamorado :: Carrera -> Auto -> Bool
estaSuEnamorado carrera auto = elem (enamorado auto) (publico carrera)


darVuelta :: Carrera -> Carrera
darVuelta carrera = carrera {participantes = map (efectoDeUnaVuelta carrera) (participantes carrera)}

efectoDeUnaVuelta :: Carrera -> Auto -> Auto
efectoDeUnaVuelta carrera auto = (soyElUltimo carrera.efectoAVelocidad.efectoAConbustible carrera) auto

efectoAConbustible :: Carrera -> Auto -> Auto
efectoAConbustible carrera auto = restarCombustibleEn (((*longitud carrera).length)(nombre auto)) auto

efectoAVelocidad :: Auto -> Auto
efectoAVelocidad auto
	| largoDeNombre auto >= 1 && largoDeNombre auto <= 5 = aumentarVelocidadEn 15 auto
	| largoDeNombre auto >= 6 && largoDeNombre auto <= 8 = aumentarVelocidadEn 20 auto
	| otherwise = aumentarVelocidadEn 30 auto

soyElUltimo :: Carrera -> Auto -> Auto
soyElUltimo carrera auto
	| esElUltimoDe carrera auto = truco auto $ auto
	| otherwise = auto

esElUltimoDe :: Carrera -> Auto -> Bool
esElUltimoDe carrera auto = (nombre.elUltimoDe)carrera == nombre auto

elUltimoDe :: Carrera  -> Auto
elUltimoDe carrera = foldl1 esMasLento (participantes carrera)

esMasLento :: Auto -> Auto -> Auto
esMasLento auto1 auto2
	| velocidad auto1 < velocidad auto2 = auto1
	| otherwise = auto2

restarCombustibleEn :: Int -> Auto -> Auto
restarCombustibleEn cantidad auto = auto {nafta = (nafta auto) - cantidad}

largoDeNombre :: Auto -> Int
largoDeNombre auto = length (nombre auto)

--correrCarrera :: Carrera -> Carrera
--correrCarrera carrera = take (vueltas carrera) (darVuelta carrera)