module FuncionalFestParte2 where

import Text.Show.Functions
import Data.List
import Test.HUnit
import Data.Ord

--Declaraciones::

data Cliente = Uncliente {nombre::String,resistencia::Int,bebidas::[Bebida],amigos::[Cliente]} deriving (Show) 

type Bebida = Cliente -> Cliente 

type Nombre = String
type Duracion = Float
type Acciones = [Bebida]
type Itinerario = (Nombre,Duracion,Acciones)

--Modelados:

mezclaExplosiva :: Itinerario
mezclaExplosiva = ("Mezcla Explosiva",2.5,[grogXD,grogXD,klusener "Huevo",klusener "Frutilla"])

itinerarioBasico :: Itinerario
itinerarioBasico = ("Itinerario Basico",5,[jarraloca,klusener "Chocolate",rescatarse 2,klusener "Huevo"])

salidaDeAmigos :: Itinerario
salidaDeAmigos = ("Salida de Amigos",1,[soda 1,tintico,reconocerCliente robertoCarlos,jarraloca])

marcos = Uncliente {
    nombre = "Marcos",
    resistencia = 40,
    bebidas = [klusener "Huevo"],
    amigos = [rodri]
}
robertoCarlos = Uncliente {
    nombre = "Roberto Carlos",
    resistencia = 165,
    bebidas = [],
    amigos = []
}
ana = Uncliente {
    nombre = "Ana",
    resistencia = 120,
    bebidas = [],
    amigos = [marcos,rodri]
}
rodri = Uncliente {
    nombre = "Rodrigo",
    resistencia = 55,
    bebidas = [tintico],
    amigos = []
}
cristian = Uncliente {
    nombre = "Cristian",
    resistencia = 2,
    bebidas = [grogXD,jarraloca],
    amigos = []
}
chuckNorris = Uncliente {
    nombre = "Chuck",
    resistencia = 1000,
    bebidas = map soda [1..],
    amigos = [ana]
}
-- Funciones Principales:

comoEsta :: Cliente -> String
comoEsta (Uncliente _ resistencia _ amigos)
    | (>50) resistencia = "Esta fresco"
    | (>1) (length amigos) = "Esta piola"
    | otherwise = "Esta Duro" 

rescatarse :: Int -> Bebida
rescatarse horas cliente 
    | (>3) horas = cliente {resistencia = modificarResistencia cliente 200}
    | otherwise = cliente {resistencia = modificarResistencia cliente 100}

grogXD :: Bebida
grogXD cliente = cliente {resistencia = 0,
                          bebidas = agregarBebidas grogXD (bebidas cliente)}

klusener :: String -> Bebida
klusener gusto cliente = cliente {resistencia = modificarResistencia cliente (-(length gusto)),
                         bebidas = agregarBebidas (klusener gusto) (bebidas cliente)}

tintico :: Bebida
tintico cliente = cliente {resistencia = modificarResistencia cliente (5*(numeroDeAmigos cliente)),
                           bebidas = agregarBebidas tintico (bebidas cliente)}

soda :: Int -> Bebida
soda fuerza cliente = cliente {nombre = (agregarERP fuerza) ++ (nombre cliente),
                               bebidas = agregarBebidas (soda fuerza) (bebidas cliente)}

jarraloca :: Bebida
jarraloca cliente = cliente {resistencia = modificarResistencia cliente (-10),
                             bebidas = agregarBebidas jarraloca (bebidas cliente),
                             amigos = map menosResistenciaf (amigos cliente)}

reconocerCliente :: Cliente -> Cliente -> Cliente
reconocerCliente otroCliente cliente
    | verificarCliente cliente otroCliente = cliente { amigos = (otroCliente : (amigos cliente))}
    | otherwise = id cliente

tomarTragos :: Cliente -> [Bebida] -> Cliente
tomarTragos cliente bebidas = foldl tomarXBebida cliente bebidas

dameOtro :: Bebida
dameOtro cliente = (head (bebidas cliente)) $ cliente

realizarItinerario :: Itinerario -> Cliente -> Cliente
realizarItinerario itinerario cliente = tomarTragos cliente (conseguirAcciones itinerario)

conocerIntensidad :: Itinerario -> Float
conocerIntensidad (nombre,duracion,acciones) = ((genericLength acciones)/duracion)

cualesPuedeTomar :: Cliente -> [Bebida] -> [Bebida]
cualesPuedeTomar cliente bebidas = filter (loDejaEnCero cliente) bebidas 

cuantasPuedeTomar :: Cliente -> [Bebida] -> Int
cuantasPuedeTomar cliente bebidas = length ((cualesPuedeTomar cliente) bebidas)

aplicarElMasIntenso :: [Itinerario] -> Cliente -> Cliente
aplicarElMasIntenso itinerarios cliente = realizarItinerario (itinerarioMasIntenso itinerarios) cliente

--Funciones Auxiliares:

verificarCliente :: Cliente -> Cliente -> Bool
verificarCliente cliente otroCliente = esElMismo cliente otroCliente && not(yaEsAmigo cliente otroCliente) 

modificarResistencia :: Cliente -> Int -> Int
modificarResistencia (Uncliente _ resistencia _ _) numero = resistencia + numero

menosResistenciaf :: Cliente -> Cliente
menosResistenciaf (Uncliente nombre resistencia bebidas amigos) = Uncliente nombre (resistencia - 10) bebidas amigos

agregarERP :: Int-> String
agregarERP fuerza = "e"++(take fuerza(repeat 'r'))++"p"

esElMismo :: Cliente -> Cliente -> Bool
esElMismo (Uncliente nombre resistencia bebidas amigos) (Uncliente otroNombre otraResistencia otrasBebidas otrosAmigos) = nombre /= otroNombre

yaEsAmigo :: Cliente -> Cliente -> Bool
yaEsAmigo cliente otroCliente = any (esElMismo otroCliente) (amigos cliente)

numeroDeAmigos :: Cliente -> Int
numeroDeAmigos (Uncliente _ _ _ amigos) = length amigos

agregarBebidas :: Bebida -> [Bebida] -> [Bebida]
agregarBebidas bebida bebidas = bebida : bebidas

tomarXBebida :: Cliente -> Bebida -> Cliente
tomarXBebida cliente bebida = bebida $ cliente

conseguirAcciones :: Itinerario -> [Bebida]
conseguirAcciones (_,_,acciones) = acciones

loDejaEnCero :: Cliente -> Bebida -> Bool
loDejaEnCero cliente bebida = ((>0).resistencia.bebida) cliente

itinerarioMasIntenso :: [Itinerario] -> Itinerario
itinerarioMasIntenso [itinerario1] = itinerario1
itinerarioMasIntenso (x:y:xs) 
        | (conocerIntensidad x)>(conocerIntensidad y) = itinerarioMasIntenso (x:xs)
        | otherwise = itinerarioMasIntenso (y:xs)

--Respuestas escritas:
{-

4)B) salidaDeAmigos rodri / mezclaExplosiva marcos

5)B) Debido a como esta definido "Head" es posible realizarlo sobre una lista infinita ya que dicha funcion solo se preocupa por la cabeza de la lista
y no por todo lo que le sigue.

5)D)Si, es posible, realizando la consulta en consola : (resistencia chuckNorris)>(resistencia ana)

-}


