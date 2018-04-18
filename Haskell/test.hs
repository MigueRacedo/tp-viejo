import Test.Hspec
import FuncionalFestParte2

main = hspec $ do

	describe "soda" $ do
		it "Marcos toma una soda de nivel 3 y queda con 2 bebidas" $ do
			soda 3 marcos `shouldBe` Uncliente {nombre = "errrpMarcos", resistencia = 40, bebidas = [<function>,<function>], amigos = [Uncliente {nombre = "Rodrigo", resistencia = 55, bebidas = [<function>], amigos = []}]}

		it "Marcos toma una soda de nivel 3 y queda con 40 de resistencia" $ do
			soda 3 marcos `shouldBe` Uncliente {nombre = "errrpMarcos", resistencia = 40, bebidas = [<function>,<function>], amigos = [Uncliente {nombre = "Rodrigo", resistencia = 55, bebidas = [<function>], amigos = []}]}

	describe "tomarTragos" $ do
		it "Rodri toma una soda de nivel 1 y una soda de nivel 2 y queda con nombre errperpRodri" $ do
			tomarTragos rodri [soda 1,soda 2] `shouldBe` Uncliente {nombre = "errperpRodrigo", resistencia = 55, bebidas = [<function>,<function>,<function>], amigos = []}

		it "Marcos toma un klusener de huevo, un tintico y una jarraLoca y queda con 30 de resistencia" $ do
			tomarTragos marcos [klusener "huevo",tintico,jarraloca] `shouldBe` Uncliente {nombre = "Marcos", resistencia = 30, bebidas = [<function>,<function>,<function>,<function>], amigos = [Uncliente {nombre = "Rodrigo", resistencia = 45, bebidas = [<function>], amigos = []}]}

		it "Marcos toma un klusener de huevo, un tintico y una jarraLoca y queda con 4 bebidas en el historial" $ do
			tomarTragos marcos [klusener "huevo",tintico,jarraloca] `shouldBe` Uncliente {nombre = "Marcos", resistencia = 30, bebidas = [<function>,<function>,<function>,<function>], amigos = [Uncliente {nombre = "Rodrigo", resistencia = 45, bebidas = [<function>], amigos = []}]}

	describe "dameOtro" $ do
		it "Ana pide “dame otro” y debe dar error" $ do
			pending

		it "Marcos pide “dame otro” y tiene 2 bebidas en el historial" $ do
			dameOtro marcos `shouldBe` Uncliente {nombre = "Marcos", resistencia = 35, bebidas = [<function>,<function>], amigos = [Uncliente {nombre = "Rodrigo", resistencia = 55, bebidas = [<function>], amigos = []}]}

		it "Marcos pide “dame otro” y lo deja con 35 de resistencia" $ do
			dameOtro marcos `shouldBe` Uncliente {nombre = "Marcos", resistencia = 35, bebidas = [<function>,<function>], amigos = [Uncliente {nombre = "Rodrigo", resistencia = 55, bebidas = [<function>], amigos = []}]}

		it "Rodri toma una soda de nivel 1, y "dameOtro" da como resultado que tiene 3 bebidas" $ do
			((dameOtro).(soda 1)) rodri `shouldBe` Uncliente {nombre = "erperpRodrigo", resistencia = 55, bebidas = [<function>,<function>,<function>], amigos = []}

		it "Rodri toma una soda de nivel 1, y "dameOtro" da como resultado que su nombre queda “erperpRodri”" $ do
			((dameOtro).(soda 1)) rodri `shouldBe` Uncliente {nombre = "erperpRodrigo", resistencia = 55, bebidas = [<function>,<function>,<function>], amigos = []}

	describe "cuantasPuedeTomar" $ do
		it "Rodri puede tomar dos bebidas, entre un grog XD, un tintico y un klusener de frutilla" $ do
			cuantasPuedeTomar rodri [grogXD,tintico,klusener "frutilla"] `shouldBe` 2

		it "Entre un grog XD, un tintico, un klusener de frutilla (con 75 u) se puede tomar una sola bebida" $ do
		cuantasPuedeTomar rodri [grogXD,tintico,klusener "fruuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuutilla"] `shouldBe` 1
		