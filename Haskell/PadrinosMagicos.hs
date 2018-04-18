import Text.Show.Functions

data Chico = UnChico {nombre::String,edad::Int,habilidades::[Habilidad],deseos::[Deseo]} deriving (Show)
data Chica = UnChica {nombrec::String,condiciones::[Condicion]} deriving (Show)

type Habilidad = String
type Deseo = Chico -> Chico
type Padrino = Chico -> Chico
type Condicion = Chico -> Bool

--A)

timmy = UnChico {nombre = "Timmy",
                 edad = 10,
                 habilidades = ["Mirar Television","Jugar en la PC"],
                 deseos = [serMayor]}

trixie = UnChica {nombrec = "Trixie Tang",
                  condiciones = [noEsTimmy]}

vicky = UnChica {nombrec = "vicky",
                  condiciones = [tieneHabilidad "ser un supermodelo noruego"]}

aprenderHabilidades :: [Habilidad] -> Deseo
aprenderHabilidades listHabilidades chico = chico { habilidades = listHabilidades ++ habilidades chico}

--serGrosoEnNeedForSpeed :: Deseo
--serGrosoEnNeedForSpeed chico = chico { habilidades = (map jugarNeedForSpeed [1..]) ++ habilidades chico}

serMayor :: Deseo
serMayor chico = chico { edad = 18}

wanda :: Padrino
wanda chico = madurar $ (head (deseos chico) $ chico)

cosco :: Padrino
cosco (UnChico nombre edad habilidades deseos) = UnChico nombre (div edad 2) habilidades deseos

muffinMagico :: Padrino
muffinMagico chico = foldl cumplirDeseo chico (deseos chico)

--B)

tieneHabilidad :: Habilidad -> Condicion
tieneHabilidad habilidad chico = elem habilidad (habilidades chico)

esSuperMaduro :: Condicion
esSuperMaduro chico = ((>18).edad) chico && elem "Manejar" (habilidades chico)

--quienConquistaA :: Chica -> [Chico] -> Chico
--quienConquistaA chica pretendientes = foldl laConquista chica pretendientes
--	|cumpleCondicion chico = True
--	|otherwise = last pretendientes

--C)

infractoresDeDaRules :: [Chico] -> [Chico]
infractoresDeDaRules chicos = filter tieneProhibidos chicos

-------------------------------------------------

jugarNeedForSpeed :: Deseo
jugarNeedForSpeed chico = chico { habilidades = "jugarNeedForSpeed" : habilidades chico}

madurar :: Deseo
madurar chico = chico { edad = edad chico + 1}

cumplirDeseo :: Chico -> Deseo -> Chico
cumplirDeseo chico deseo = deseo $ chico

noEsTimmy :: Condicion
noEsTimmy chico = (nombre chico) /= "Timmy"

cumpleCondicion :: Chico -> Condicion -> Bool
cumpleCondicion chico condicion = condicion $ chico

laConquista :: Chico -> Chica -> Bool
laConquista chico chica = foldl (\ bool cumpleCondicion -> bool && cumpleCondicion chico) True (condiciones chica)

tieneProhibidos :: Condicion
tieneProhibidos chico
	| elem "Enamorar" (habilidades chico) = True
	| elem "Matar" (habilidades chico) = True
	| elem "Dominar El Mundo" (habilidades chico) = True
	| otherwise = False