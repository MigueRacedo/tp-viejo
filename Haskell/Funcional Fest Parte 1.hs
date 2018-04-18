data Cliente = Uncliente {nombre::String,resistencia::Int,amigos::[Cliente]} deriving (Eq,Show)

marcos = Uncliente {
	nombre = "Marcos",
	resistencia = 40,
	amigos = []
}

ana = Uncliente {
	nombre = "Ana",
	resistencia = 120,
	amigos =[marcos,rodri]
}

rodri = Uncliente {
	nombre = "Rodrigo",
	resistencia = 55,
	amigos = []
}

cristian = Uncliente {
	nombre = "Cristian",
	resistencia = 2,
	amigos = []
}

comoEsta :: Cliente -> String
comoEsta (Uncliente _ resistencia amigos)
	| (>50) resistencia = "Esta fresco"
	| (>1) (length amigos) = "Esta piola"
	| otherwise = "Esta Duro"
  
rescatarse :: Int -> Cliente -> Cliente
rescatarse horas cliente@(Uncliente nombre resistencia amigos) 
		| (>3) horas = masResistencia cliente 200
		| otherwise = masResistencia cliente 100

grogXD :: Cliente -> Cliente
grogXD (Uncliente nombre resistencia amigos) = Uncliente nombre (resistencia - resistencia) amigos

klusener :: String -> Cliente -> Cliente
klusener gusto (Uncliente nombre resistencia amigos) = Uncliente nombre (resistencia - (length gusto)) amigos

tintico :: Cliente -> Cliente
tintico (Uncliente nombre resistencia amigos) = Uncliente nombre (resistencia + (5 * (length amigos))) amigos

soda :: Int -> Cliente -> Cliente
soda fuerza (Uncliente nombre resistencia amigos) = Uncliente ("e"++(take fuerza(repeat 'r'))++"p"++nombre) resistencia amigos

jarraloca :: Cliente -> Cliente
jarraloca (Uncliente nombre resistencia amigos) = Uncliente nombre (resistencia - 10) (map menosResistencia amigos)

reconocerCliente :: Cliente -> Cliente -> Cliente
reconocerCliente otroCliente@(Uncliente otroNombre otroResistencia otrosAmigos) cliente@(Uncliente nombre resistencia amigos) 
	| verificarCliente cliente otroCliente = Uncliente nombre resistencia (otroCliente : amigos)
	| otherwise = id cliente

-- El primer cliente que se introduce es el que se va a agregar a la lista del segundo cliente. Se hizo asi por la conveniencia de composicion para el punto 7)

--Funciones Auxiliares:

masResistencia :: Cliente -> Int -> Cliente
masResistencia (Uncliente nombre resistencia amigos) cantidad = Uncliente nombre (resistencia+cantidad) amigos

verificarCliente :: Cliente -> Cliente -> Bool
verificarCliente cliente@(Uncliente nombre resistencia amigos) otroCliente@(Uncliente otroNombre otroResistencia otrosAmigos) = nombre /= otroNombre && not (any (== otroCliente) amigos)  

menosResistencia :: Cliente -> Cliente
menosResistencia (Uncliente nombre resistencia amigos) = Uncliente nombre (resistencia - 10) amigos

-- Itinerario de Ana:: ((jarraloca).(klusener "chocolate").(rescatarse 2).(klusener "huevo")) ana




