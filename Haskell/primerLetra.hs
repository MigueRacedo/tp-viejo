esMultiploDe :: Int -> Int -> Bool
esMultiploDe numero1 numero2 = (mod numero1 numero2) == 0

esBisiesto :: Int -> Bool
esBisiesto anio = esMultiploDe anio 4 && not (esMultiploDe anio 100) || esMultiploDe anio 400