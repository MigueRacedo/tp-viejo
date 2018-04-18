data DJ = UnDJ {nombreD::String,puntosD::Int} deriving (Show)
data Festival = UnFestival {nombreF::String,puntosF::Int} deriving (Show)

--1)
martin = UnDJ {nombreD = "Martin", puntosD = 100}
jose = UnDJ {nombreD = "Jose", puntosD = 200}
lucas = UnDJ {nombreD = "Lucas", puntosD = 300}
tomas = UnDJ {nombreD = "Tomas", puntosD = 400}
pedro = UnDJ {nombreD = "Pedro", puntosD = 500}

--2)
awakenings = UnFestival {nombreF = "Awakenings", puntosF = 100}
timeWarp = UnFestival {nombreF = "TimeWarp", puntosF = 180}
tomorrowland = UnFestival {nombreF = "Tomorrowland", puntosF = 25}

--3)
pasarMusica :: DJ -> Festival -> DJ
pasarMusica (UnDJ nombreD puntosD) (UnFestival nombreF puntosF) = UnDJ nombreD (puntosD + puntosF)

--4)
deGira :: DJ -> [Festival] -> DJ
deGira dj festivales = foldl pasarMusica dj festivales