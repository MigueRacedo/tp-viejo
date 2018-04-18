type Bebida = Cliente -> Cliente
data Cliente = Uncliente {nombre::String,resistencia::Int,amigos::[Cliente],bebidas::[Bebida]} deriving (Eq,Show)

marcos = Uncliente {
	nombre = "Marcos",
	resistencia = 40,
	amigos = [],
	bebidas = []
}

ana = Uncliente {
	nombre = "Ana",
	resistencia = 120,
	amigos =[],
	bebidas = []
}

rodri = Uncliente {
	nombre = "Rodrigo",
	resistencia = 55,
	amigos = [],
	bebidas = []
}

cristian = Uncliente {
	nombre = "Cristian",
	resistencia = 2,
	amigos = [],
	bebidas = []
}

comoEsta :: Cliente -> String
comoEsta (Uncliente _ resistencia amigos bebidas)
	| (>50) resistencia = "Esta fresco"
	| (>1) (length amigos) = "Esta piola"
	| otherwise = "Esta Duro"
  
rescatarse :: Int -> Cliente -> Cliente
rescatarse horas cliente@(Uncliente nombre resistencia amigos bebidas) 
		| (>3) horas = masResistencia cliente 200
		| otherwise = masResistencia cliente 100

grogXD :: Bebida
grogXD (Uncliente nombre resistencia amigos bebidas) = Uncliente nombre (resistencia - resistencia) amigos (bebidas : "grogXD")

klusener :: String -> Bebida
klusener gusto (Uncliente nombre resistencia amigos bebidas) = Uncliente nombre (resistencia - (length gusto)) amigos

tintico :: Bebida
tintico (Uncliente nombre resistencia amigos bebidas) = Uncliente nombre (resistencia + (5 * (length amigos))) amigos

soda :: Int -> Bebida
soda fuerza (Uncliente nombre resistencia amigos bebidas) = Uncliente ("e"++(take fuerza(repeat 'r'))++"p"++nombre) resistencia amigos

--jarraloca

reconocerCliente :: Cliente -> Cliente -> Cliente
reconocerCliente cliente@(Uncliente nombre resistencia amigos bebidas) otroCliente@(Uncliente otroNombre otroResistencia otrosAmigos otrasBebidas)
	| verificarCliente cliente otroCliente = Uncliente nombre resistencia (otroCliente : amigos) bebidas
	| otherwise = id cliente



--Funciones Auxiliares

masResistencia :: Cliente -> Int -> Cliente
masResistencia (Uncliente nombre resistencia amigos bebidas) cantidad = Uncliente nombre (resistencia+cantidad) amigos bebidas

verificarCliente :: Cliente -> Cliente -> Bool
verificarCliente cliente@(Uncliente nombre resistencia amigos bebidas) otroCliente@(Uncliente otroNombre otroResistencia otrosAmigos otrasBebidas) = nombre /= otroNombre && not (any (== otroCliente) amigos)  






