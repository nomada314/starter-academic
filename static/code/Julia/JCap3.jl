# -*- coding: utf-8 -*-
# ---
# jupyter:
#   jupytext:
#     text_representation:
#       extension: .jl
#       format_name: light
#       format_version: '1.5'
#       jupytext_version: 1.14.0
#   kernelspec:
#     display_name: Julia 1.7.2
#     language: julia
#     name: julia-1.7
# ---

using Pkg
Pkg.add("CSV")
Pkg.add("XLSX")
Pkg.add("HTTP")
Pkg.add("Chain")
Pkg.add("DataFrames")
Pkg.add("DataFramesMeta")
Pkg.add("CategoricalArrays")

# ### Bloque de código 3.1: Creación de un conjunto de datos manualmente

using DataFrames
cdInicial = DataFrame(
    identificador = [20120192, 20020265, 20100101],
    ingreso = [1000, 1200, 1500],
    edad = [26, 35, 25]
)

# ### Bloque de código 3.2: Creación de un conjunto de datos con valores aleatorios

cdFicticio = DataFrame(
    :id => 1001:1050,
    :color => rand(["", "Rubio", "Negro","Blanco","Azul"], 50),
    :edad => rand(16:23, 50),
    :peso => round.(60 .+  10*randn(50); digits = 1)
)

# ### Bloque de código 3.3: Creación del conjunto de datos `CCSS` usando la información en la Tabla 1.2.

CuerposCelesteSS = [0.3300	4879	 5427	 3.7;
                    4.8700	12104	 5243	 8.9;
                    5.9700	12756	 5514	 9.8;
                    0.0730	3475	 3340	 1.6;
                    0.6420	6792	 3933	 3.7;
                 1898.0000	142984   1326	 23.1;
                  568.0000	120536   687	 9.0;
                   86.8000	51118	 1271	 8.7;
                  102.0000	49528	 1638	 11.0;
                    0.0146	2370	2095   0.7];

DataFrame(CuerposCelesteSS,["Masa","Diametro","Densidad","Gravedad"])
CCSS = DataFrame(CuerposCelesteSS,:auto)

# ### Bloque de código 3.4: Cambio de nombres de las variables en el conjunto de datos `CCSS`

rename!(CCSS, ["MASA","DIAMETRO","DENSIDAD","GRAVEDAD"])
rename!(CCSS, [:MASa,:DIAmetro,:DENsidad,:GRAvedad])
rename!(x -> x[1:2], CCSS)
rename!(lowercase, CCSS)

# ### Bloque de código 3.5: Adición del volumen de los cuerpos celestes al conjunto de datos `CCSS`

CCSS.vo = 10^15*CCSS.ma./CCSS.de

# ### Bloque de código 3.6: Adición del volumen de los cuerpos celestes al conjunto de datos `CCSS`

CCSS.no = ["Mercurio", "Venus", "Tierra", "Luna", "Marte", "Jupiter", "Saturno", "Urano",  "Neptuno",  "Pluton" ]

CCSS.ma

# ## Sección 3.2: Lectura de datos

# ### Bloque de código 3.7: Descarga del archivo con información de los partidos entre selecciones en toda la historia.

using Downloads
using CSV
dir = "https://raw.githubusercontent.com/martj42/international_results/master/results.csv"
elo0 = Downloads.download(dir)

# ### Bloque de código 3.8: Lectura de los partidos entre selecciones en toda la historia

elo1 = CSV.File(elo0, missingstring = "NA")
elo = DataFrame(elo1)

# ### Bloque de código 3.9: Descarga y lectura de información de los partidos entre selecciones en toda la historia

elo = DataFrame(CSV.File(Downloads.download(dir), missingstring = "NA"))

# ### Bloque de código 3.10: Lectura de los partidos entre selecciones en toda la historia usando `Chain.jl`

using Chain
elo = @chain dir begin
    Downloads.download
    CSV.File(missingstring = "NA")
    DataFrame
    rename!(["fecha", "local", "visitante", "goles_local", "goles_visitante", "torneo", "ciudad", "pais", "neutral"])
end;

# ### Bloque de código 3.11: Estadísticas descriptivas para goles de local y visitante de los últimos 100 partidos de selecciones

@chain elo begin
    last(100)
    describe(cols = [:goles_local, :goles_visitante])
end

# ### Bloque de código 3.12: Transformación de variables con cadenas de caracteres a variables categóricas

using CategoricalArrays
elo.neutral = categorical(elo.neutral)
elo.torneo = categorical(elo.torneo)
elo.local = categorical(elo.local)
elo.visitante = categorical(elo.visitante)
elo.pais = categorical(elo.pais)
elo.ciudad = categorical(elo.ciudad);

show(first(elo,5),allcols=true)

# ### Bloque de código 3.13: Comandos básicos para acceso a características de un conjunto de datos

first(elo,5)
last(elo,5)
names(elo)
show(first(elo, 10), allcols = true)
show(last(elo, 10), allcols = true)
size(elo)
size(elo,1)
size(elo,2)

# ### Bloque de código 3.14: Lectura de un archivo en formato MS Excel

using XLXS

codigos = DataFrame(XLSX.readtable("Codigos.xlsx","23SemI")...)

# ### Bloque de código 3.15: Lectura de un archivo en formato MS Excel sin usar el operador *splat*

using XLXS
prov = XLSX.readtable("Codigos.xlsx", "23SemI")
codigos = DataFrame(prov[1],prov[2])

# ### Bloque de código 3.16: Cálculo del número de semestres dado el código

p0 = codigos.Codigo/100_000
agno = trunc.(Int,p0)
semestre = trunc.(p0*10) - 10agno
nSem = 2*(2023 .-  agno) .+  (semestre .== 1)

# ### Bloque de código 3.17: Cálculo del número de semestres dado el código usando secuencias de caracteres

codigos.Codigo = string.(codigos.Codigo)
codigos.agno = parse.(Int32,SubString.(codigos.Codigo, 1, 4))
codigos.semestre = parse.(Int32,SubString.(codigos.Codigo, 5, 5))
codigos.sem = 2*(2021 .-  codigos.agno) .+  (codigos.semestre .== 1)

# ### Bloque de código 3.18: Adición del volumen de los cuerpos celestes al conjunto de datos `CCSS` utilizando la función `transform()`

transform(CCSS, [:ma,:de] => ((a,b) -> a./b) => :vo)
transform!(CCSS, [:ma,:de] => ((a,b) -> a./b) => :vo)
transform!(CCSS, [:ma,:de] => ByRow((a,b) -> a/b) => :vo)

# ### Bloque de código 3.19: Adición del volumen de los cuerpos celestes al conjunto de datos `CCSS` utilizando la macro `@transform`

using DataFramesMeta
@transform!(CCSS, :vo = :ma./:de)

# ### Bloque de código 3.20: Cálculo del número de semestres dado el código usando macros

@chain codigos begin
    @transform!(:Codigo = string.(:Codigo))
    @transform!(:agno = parse.(Int32,SubString.(:Codigo, 1, 4)))
    @transform!(:semestre = parse.(Int32,SubString.(:Codigo, 5, 5)))
    @transform!(:nsem = 2*(2021 .- :agno) .+  (:semestre .== 1))
end

# ### Bloque de código 3.21: Lectura del conjunto de datos pingüinos de Palmer

using DataFrames
using DataFramesMeta
using PalmerPenguins
pinguinos = DataFrame(PalmerPenguins.load())
names(pinguinos)
rename!(pinguinos, "species" => "especie", "island" => "isla",
        "bill_length_mm" => "longitudPico", "bill_depth_mm" => "profundidad",
        "flipper_length_mm" => "longitudAleta", "body_mass_g" => "masa", "sex" => "sexo")

# ### Bloque de código 3.22: Cálculo de la razón del pico para los pingüinos de Palmer

using DataFramesMeta, CategoricalArrays
@rtransform!(pinguinos, :razon = :longitudPico/:profundidad)
@transform(pinguinos, :especie = categorical(:especie), :isla = categorical(:isla),:sexo = categorical(:sexo))

@transform!(pinguinos, @byrow :razon = :longitudPico/:profundidad)

transform(pinguinos, [:longitudPico,:profundidad] => ByRow((a,b) −> a/b) => :razon)

# ## Sección 3.2: Subconjuntos

# ### Bloque de código 3.23: Eliminación de observaciones repetidas usando el operador de rango

sort!(codigos,:Codigo)
codigos = codigos[1:2:end,:]

# ### Bloque de código 3.24: Eliminación de observaciones repetidas usando la función `unique()`

unique!(codigos,:Codigo)

# ### Bloque de código 3.25: Filtración de estudiantes con matrícula igual a $ 42700 usando la macro `@subset`

minMat = @subset(codigos, :valor .== 42700)

# ### Bloque de código 3.26: Filtración de pingüinos de la especie *Gentoo* utilizando una regla empírica de diferentes maneras

@subset(pinguinos, (:bill_length_mm .> 40) .& (:bill_depth_mm .<= 16.5))
@subset(pinguinos, :bill_length_mm .> 40, :bill_depth_mm .<= 16.5)
@subset pinguinos begin
    :bill_length_mm .> 40
    :bill_depth_mm .<= 16.5
end

# ### Bloque de código 3.27: Filtración de pingüinos de la especie *Adélie* utilizando una regla empírica.
#

@subset(pinguinos, :profundidad + 4.7 .> 0.53*:longitud)

# ### Bloque de código 3.28: Tipo de datos de la variable profundidad del pico para el conjunto de pingüinos de Palmer

typeof(pinguinos.profundidad)

# ### Bloque de código 3.29: Listar los individuos con valores faltantes del conjunto de datos pingüinos de Palmer

show(@subset(pinguinos,ismissing.(:sexo)), allcols = true)

# ### Bloque de código 3.30: Lectura de la ubicación de sensores AQS

# +
adicionarCeros(s; l = 4) =  length(s) < l ?  "0"^(l-length(s))*s : s

aqs = @chain "aqs_sites.csv" begin
    CSV.File
    DataFrame
    rename!("State Code" => "Estado", 
            "County Code" => "Condado",
            "Site Number" => "Sitio",
            "Site Closed Date" => "final")
    @subset!(ismissing.(:final), :Datum .== "NAD83")
    @transform!(:id = :Estado .* "-" .* 
                      adicionarCeros.(string.(:Condado),l = 3) .* 
                      "-" .* adicionarCeros.(string.(:Sitio)))
    @select!(:id, :Latitude, :Longitude)
end
# -

# ## Sección 3.3: Concatenación y combinación

# ### Bloque de código 3.31: Lectura del archivo con información de la ubicación de los arboles en el Ejemplo de crecimiento del abeto grande

using DataFrames, CSV, Chain, DataFramesMeta

abiesUbicacion = @chain "Datos/abetoHabitat.csv" begin
    CSV.File    
    DataFrame
    @transform!(:id = string.(:id))
end

# ### Bloque de código 3.32: Lectura de los archivos con información de la edad, DAP y altura de los 66 arboles en el Ejemplo de crecimiento del abeto grande

abies0 = (DataFrame(CSV.File("Data/fir"*string(i)*".csv")) for i in 1:66)

abies = @chain abies0 begin
    vcat(_...)
    @transform!(:altura = :altura./3.28084, :dap = :dap./0.3937008)
    @transform!(:ID = string.(:ID))
end

# ### Bloque de código 3.33: Lectura de los archivos con información de la precipitación mensual en Kew Gardens

using DataFrames, CSV, Chain, DataFramesMeta
mes = ("Ene", "Feb", "Mar", "Abr", "May", "Jun", "Jul", "Ago", "Sep", "Oct", "Nov", "Dic")
prec0 = (DataFrame(CSV.File("Data/precipitacion"*i*".csv")) for i in mes)
prec = @chain prec0 begin
    innerjoin(_..., on = :year, makeunique = true)    
    rename!(_,(j  => mes[i] for (i,j) in enumerate(names(_)[2:13]))...)
end

collect(prec0[1])

# ### Bloque de código 3.34: Combinación de la ubicación de los árboles y sus características en el Ejemplo de crecimiento del abeto grande

abiesG = innerjoin(abiesUbicacion, abies, on = :id => :ID)

# ### Bloque de código 3.35: Combinación de conjuntos empleando la función `outerjoin()`

using DataFrames, DataFramesMeta
A1 = DataFrame( ID = [202319876, 202319877, 202319878, 202319879, 202319880, 202319881], NotaA1 = [4.2, 3.8, 2.7, 3.2, 3, 3.9])
A2 = DataFrame( ID = [202319876, 202319877, 202319882, 202319883, 202319884], NotaA2 = [3.2, 3.4, 3.9, 2.9, 3.9])
A3 = DataFrame( ID = [202319878, 202319879, 202319880, 202319881, 202319883, 202319884], NotaA3 = [4,3.6,3,3.9,2.9,3.6])
outerjoin(A1, A2, A3, on = :ID)
function cumpleRequisito(x,y,z)
    x = ismissing(x) ? 0 : x
    y = ismissing(y) ? 0 : y
    z = ismissing(z) ? 0 : z
    return (x >=3.0) + (y >= 3.0) + (z >= 3.0) >= 2
end
@rtransform! A  :requisito = cumpleRequisito(:NotaA1,:NotaA2,:NotaA3)

# ### Bloque de código 3.36: Combinación de conjuntos empleando la función `crossjoin()`

using DataFrames, CategoricalArrays
F1 = DataFrame(nivelF1 = categorical(["F11", "F12"]))
F2 = DataFrame(nivelF2 = categorical(["F21", "F22", "F23"]))
F3 = DataFrame(nivelF3 = categorical(["F31", "F32", "F33", "F34"]))
diseno = crossjoin(F1, F2, F3)
diseno = diseno[sortperm(rand(2*3*4)),:]

# ### Bloque de código 3.37: Inclusión de los valores de importancia de los partidos y exclusión de países no pertenecientes a la FIFA en el conjunto de datos `elo`

valoresK = CSV.read("Data/valoresK.csv", DataFrame)
paises = CSV.read("Data/Paises.txt", DataFrame, delim=' ')


@chain elo begin
    leftjoin!(valoresK, on = :torneo)
    @subset!(:k .!= 0)
    leftjoin!(paises, on = :local => :Pais)
    @subset!(ismissing.(:Eliminar))
    select!(Not.(:Eliminar))
    leftjoin!(paises, on = :visitante => :Pais) 
    @subset!(ismissing.(:Eliminar))
    select!(Not.(:Eliminar))
end

# ## Sección 3.4 Estrategia SAC

# ### Bloque de código 3.38: Cálculo de la media y la desviación estándar para algunas variables del conjunto de datos `pinguinos`

using Statistics
pinguinosDes = @chain pinguinos begin
    groupby(:especie)
    @combine begin
        :promedio = mean(:longitudPico)
        :minimo= minimum(:longitudPico)
        :maximo  = maximum(:longitudPico)
        :n = length(:longitudPico)
    end
end

# ### Bloque de código 3.39: Cálculo de la media y la desviación estándar para algunas variables del conjunto de datos `pinguinos` utilizando la función `skipmissing()`

using Statistics
pinguinosDes = @chain pinguinos begin
    groupby(:especie)
    @combine begin
        :promedio = mean(skipmissing(:longitudPico))
        :minimo = minimum(skipmissing(:longitudPico))
        :maximo = maximum(skipmissing(:longitudPico))
        :total = length(:longitudPico)
    end
end

# ### Bloque de código 3.40: Cálculo de la media y la desviación estándar para algunas variables del conjunto de datos `pinguinos` utilizando la función `skipmissing()` y el argumento `$AsTable`

using Statistics
pinguinosDes = @chain pinguinos begin
    groupby(:especie)
    @combine($AsTable= (longitud_m = mean(skipmissing(:longitudPico)),
                      min_sleep = minimum(skipmissing(:longitudPico)),
                      max_sleep = maximum(skipmissing(:longitudPico)),
                      total = length(:longitudPico)))
    end
end

# ### Bloque de código 3.41: Cálculo del número de partidos de fútbol por año y tipo de competencia

nPartidosAgno = @chain elo begin
    @rtransform(:year = year(:fecha),
                :amistoso = :torneo == "Friendly" ? "Amistoso" : "Competencia")
    groupby([:year, :amistoso])
    @combine(_, :nJuegos = length(:local))
end

# ### Bloque de código 3.42: Lectura de los valores PM$_{2.5}$ AQI  para sensores AQS y PurpleAir estudiados por Barkjohn *et al.* (2021)

using DataFrames, DataFramesMeta, CSV, Chain
variablesAusar = [:Date, :region, :PM25FM, :PM25cf1, :RH]

aqs = @chain "Datos/Full24hrdataset.csv" begin
    CSV.File(select = variablesAusar, missingstring = "NA")
    DataFrame
    dropmissing!
    rename!("Date" => "Fecha", "PM25FM" => "PM25aqs", 
            "PM25cf1" => "PM25purple", "RH" => "HumedadRelativa")
    sort!(:Fecha) 
end

# ### Bloque de código 3.43: Lectura de los valores PM$_{2.5}$ AQI  para sensores AQS y PurpleAir estudiados por Barkjohn *et al.* (2021)

using Statistics
aqsSemanal = @chain aqs begin
    @transform!(:semana = 52 .*(mod.(year.(:fecha),2017)) .+ week.(:fecha) )
    groupby(:semana)
    @combine(:promedio = mean(:PM25aqs), :f1 = first(:fecha))
end

aqsMV5 = @chain aqsSemanal begin    
    @transform!(:ma = ceil.(Int64,(:semana .- (first(semana)-1))./5))
    groupby(:ma)
    @combine(:promedioMA = mean(:promedio), :f2 = last(:f1))
    @rsubset(:ma < 25)
end

# ### Bloque de código 3.44: Diagrama de dispersión de la profundidad vs longitud del pico de los pingüinos de Palmer

using AlgebraOfGraphics
using CairoMakie
pinguinosFig1  = data(pinguinos)*
                mapping(:longitudPico, :profundidad, 
                color = :especie, marker = :especie)*
                visual(AlgebraOfGraphics.Scatter)

xy = DataFrame(x = 34:50, y = -4.7 .+ 0.53(34:50))                

recta = data(xy)*mapping(:x,:y)*visual(Lines)

draw(pinguinosFig1+recta)

# ### Bloque de código 3.45: Diagrama de dispersión de la profundidad vs longitud del pico de los pingüinos de Palmer con un tema preespecificado

using AlgebraOfGraphics, CairoMakie
set_aog_theme!()

pinguinosFig2 = data(pinguinos) * 
                mapping(:longitudPico => "Longitud del pico (mm)",
                :profundidad => "Profundidad del pico (mm)")* 
                mapping(color = :especie => "Especies", 
                marker = :especie => "Especies")


recta = data(xy) * 
        mapping(:x => "Longitud del pico (mm)",
        :y => "Profundidad del pico (mm)")*
        visual(Lines)

draw(pinguinosFig2+recta)

# ### Bloque de código 3.46: Función de densidad estimada de la razón longitud  profundidad del pico por especie para los pingüinos de Palmer

set_aog_theme!()
estilo = (color=["#881178", "#2D2DB5","#328215"], )

@chain pinguinos begin
    dropmissing
    data(_)*
    mapping(:razon => "Razón longitud/profundidad del pico", 
            color= :especie => "Especie")*
    visual(Density, alpha = 0.3)
    draw(palettes = estilo)
end

# ### Bloque de código 3.47: Diagrama de violín para la razón longitud sobre profundidad del pico por sexo y especie para los pingüinos de Palmer

set_aog_theme!()
@chain pinguinos begin
    dropmissing
    data(_)*
    mapping(:sexo =>"Sexo", 
            :razon => "Razón longitud/profundidad del pico",
            color = :especie  => "Especie", dodge = :especie)*
    visual(Violin)
    draw(palettes = estilo)
end

# ### Bloque de código 3.48: Diagrama de violín para la razón longitud sobre profundidad del pico por especie y sexo para los pingüinos de Palmer

set_aog_theme!()
estilo2 = (color=["#881178", "#2D2DB5"], )

@chain pinguinos begin
    dropmissing
    data(_)*
    mapping(:especie =>"Especie", 
            :razon => "Razón longitud/profundidad del pico",
            color=:sexo  => "Sexo", dodge=:sexo)*
    visual(Violin)
    draw(palettes = estilo2)
end

# ### Bloque de código 3.49: Curvas de crecimiento para 66 abetos grandes en bosques de Idaho

using AlgebraOfGraphics, CairoMakie
curvasCrecimiento = data(abies)*
        mapping(:edad => "Edad (años)", :altura => "Altura (m)",
        marker = :ID, color=:dap => "DAP (cm)")*visual(Lines)
draw(curvasCrecimiento, colorbar=(position=:top, size=15))

# ### Bloque de código 3.50: Series de tiempo de partidos amistosos y competitivos desde el año 1930

@chain nPartidosAgno begin
    @subset(:year .> 1929)
    @rtransform(:Mundial = (mod(:year -2,4) == 0)&&
                            (:year !=1946)&&(:year !=1942))
    @aside JuegosAgnoMundial = @subset(_, :Mundial)                        
    data(_)*mapping(:year => "Año", :nJuegos => "Número de partidos", 
                    color = :amistoso => "Tipo de partido",
                    marker = :amistoso => "Tipo de partido")*
    visual(ScatterLines, alpha = 0.6)
    @aside capaAgnoMundial = data(JuegosAgnoMundial)*
            mapping(:year => "Año", :nJuegos => "Número de partidos")*
            visual(Scatter)
    draw(_+capaAgnoMundial, palettes = estiloElo)
end

# ### Bloque de código 3.51: Series de tiempo para los niveles promdeio de PM$_{2.5}$ AQI semanales y cada 5 semanas

l1 = data(aqsSemanal)*mapping(:f1 => "Fecha",
        :promedio => L"\mathrm{PM}_{2.5}\,\,\mathrm{AQI}")*
    visual(ScatterLines, color = "#328215")

l2 = data(aqsMV5)*mapping(:f2 => "Fecha",
        :promedioMA => L"\mathrm{PM}_{2.5}\,\,\mathrm{AQI}")*
        visual(ScatterLines, color = :red)

draw(l1+l2)

# ## Sección 3.6 Sistema de puntuación Élő

# ### Bloque de código 3.52: Combinación `antijoin()` de los resultados de los partidos y el *ranking* a junio de 2018 de la FIFA

ranking062018 = CSV.read("Datos/Ranking062018.csv", DataFrame)

@transform!(ranking062018, :Pais = categorical(String63.(:Pais)))

cambiarNombre = antijoin(ranking062018, elo, on =  :Pais => :local)

nombres = ["United States","Iran","DR Congo", "South Korea",
          "Cape Verde", "Ivory Coast","North Macedonia","Curaçao",
          "Kyrgyzstan", "North Korea","Taiwan", "Eswatini", 
          "Saint Kitts and Nevis", "Saint Lucia", 
          "Saint Vincent and the Grenadines",
          "São Tomé and Príncipe","Brunei",
          "United States Virgin Islands"]

for (i,j) in enumerate(cambiarNombre.Pais)
    ranking062018[findfirst(isequal(j), ranking062018.Pais),:Pais] = nombres[i]
end

# ### Bloque de código 3.53: Preparación del conjunto de datos para hacer el cálculo del puntaje Élő

using CSV, Chain, Dates, Downloads, DataFrames, DataFramesMeta, CategoricalArrays
resultadosDir = "https://raw.githubusercontent.com/martj42/international_results/master/results.csv";
penaltisDir = "https://raw.githubusercontent.com/martj42/international_results/master/shootouts.csv";
penaltis = @chain penaltisDir begin
    Downloads.download
    CSV.File(missingstring = "NA")
    DataFrame
    rename!(["fecha", "local", "visitante", "ganador"])
    @transform!(:local = categorical(:local), :visitante = categorical(:visitante))
    @transform!(:ganador = categorical(:ganador))
end;
elo = @chain resultadosDir begin
    Downloads.download
    CSV.File(missingstring = "NA")
    DataFrame
    rename!(["fecha", "local", "visitante", "goles_local", "goles_visitante", "torneo", "ciudad", "pais", "neutral"])
    @transform!(:neutral = categorical(:neutral), :torneo = categorical(:torneo))
    @transform!(:local = categorical(:local), :visitante = categorical(:visitante))
    @transform!(:pais = categorical(:pais), :ciudad = categorical(:ciudad))
    leftjoin!(penaltis, on = [:fecha, :local, :visitante])
    leftjoin!(valoresK, on = :torneo)
    @subset!(:k .!= 0)
end;
ranking062018 = CSV.read("Datos/Ranking062018.csv", DataFrame)
@transform!(ranking062018, :Pais = categorical(String63.(:Pais)))
cambiarNombre = antijoin(ranking062018, elo, on =  :Pais => :local)
nombres = ["United States","Iran","DR Congo", "South Korea",
          "Cape Verde", "Ivory Coast","North Macedonia","Curaçao",
          "Kyrgyzstan", "North Korea","Taiwan", "Eswatini", 
          "Saint Kitts and Nevis", "Saint Lucia", 
          "Saint Vincent and the Grenadines",
          "São Tomé and Príncipe","Brunei",
          "United States Virgin Islands"]
for (i,j) in enumerate(cambiarNombre.Pais)
    ranking062018[findfirst(isequal(j), ranking062018.Pais),:Pais] = nombres[i]
end;
elo = @chain elo begin
    rightjoin(ranking062018[:,[:Pais]], on = :local => :Pais)
    rightjoin(ranking062018[:,[:Pais]], on = :visitante => :Pais)
end

# ### Bloque de código 3.54: Función para el cálculo del puntaje Élő

function puntajeElo(Elocal, Evisitante, Rₗ, Rᵥ, gₗ::Int, gᵥ::Int, k::Int, neutral, penaltis)
    gd = abs(gₗ - gᵥ)
    gᵟ = 1 + 0.5*(gd == 2) + (0.75 + .125*(gd - 3))*(gd > 2)
    gₗ > gᵥ ? W= [1.0,0.0] : ( gₗ < gᵥ ? W = [0.0,1.0] : W = [0.5,0.5]) 
    if !ismissing(penaltis)
        if gₗ == gᵥ
            if Elocal == penaltis
                W[1] = 0.75
            else  
                W[2] = 0.75
            end
        end
    end
    e = (Rₗ-Rᵥ+100*(!neutral))/400
    Rₗ += k*gᵟ*(W[1] - 1/(1+10^(-e)))
    Rᵥ += k*gᵟ*(W[2] - 1/(1+10^e))
    return((L = Rₗ, V = Rᵥ))
end

# ### Bloque de código 3.55: Cálculo del puntaje Élő hasta junio de 2018

puntajes = DataFrame(Pais = ranking062018.Pais, puntaje = 1200)
puntajes = Dict(Pair.(puntajes.Pais, puntajes.puntaje));

n1 = findfirst(isequal(Date(2018,06,07)), elo.fecha )-1

for i in 1:n1
    nuevos = puntajeElo(elo.local[i],elo.visitante[i],
                        puntajes[elo.local[i]], 
                        puntajes[elo.visitante[i]],
                        elo.goles_local[i], elo.goles_visitante[i],
                        elo.k[i], elo.neutral[i],elo.penaltis[i])
    puntajes[elo.local[i]] = nuevos.L
    puntajes[elo.visitante[i]] = nuevos.V
end

elo062018 = DataFrame(Pais = collect(keys(puntajes)), Puntaje = collect(values(puntajes)))

comp062018 = innerjoin(ranking062018,elo062018, on = :Pais, makeunique=true)

# ### Bloque de código 3.56: Diagrama de dispersión para el puntaje Élő y el antiguo puntaje FIFA hasta el 6 de junio de 2018

using CairoMakie
CairoMakie.activate!()
fig, ax, p = scatter(comp062018.Puntaje, comp062018.Puntaje_1;
                                axis = (; xlabel = "Puntaje FIFA", 
                                ylabel = "Puntaje Élő"),
                                figure = (; resolution=(600, 600)))
text!("Brazil", position = (1431, 1540.08+40), 
      align = (:center, :center), color=:darkred, textsize = 13)
text!("Alemania", position = (1558, 1481.08-40), 
      align = (:right, :center),  color=:darkred, textsize = 13)
text!("Colombia", position = (986-40, 1351.46+40),
      align = (:center, :center), color=:darkred, textsize = 13)
fig

# ### Bloque de código 3.57: Cálculo del puntaje Élő hasta mayo de 2022

puntajes = DataFrame(Pais = ranking062018.Pais, puntaje = 1600 .- 4 .*(ranking062018.Posicion .-1))
puntajes = Dict(Pair.(puntajes.Pais, puntajes.puntaje));

n2 = findlast(isequal(Date(2022,03,30)), elo.fecha)

for i in (n1+1):n2
    nuevos = puntajeElo(elo.local[i],elo.visitante[i],
                        puntajes[elo.local[i]], 
                        puntajes[elo.visitante[i]],
                        elo.goles_local[i], elo.goles_visitante[i],
                        elo.k[i], elo.neutral[i],elo.penaltis[i])
    puntajes[elo.local[i]] = nuevos.L
    puntajes[elo.visitante[i]] = nuevos.V
end

elo032022 = DataFrame( Pais = collect(keys(puntajes)), Puntaje = collect(values(puntajes)))

# ### Bloque de código 3.58: Comparación del  puntaje Élő obtenido con el puntaje oficial de la FIFA a 31 de marzo de 2022

using DataFrames
using DataFramesMeta
ranking032022 = CSV.read("Datos/Ranking032022.csv", DataFrame)

@transform!(ranking032022, :Pais = categorical(String63.(:Pais)))

cambiarNombre = antijoin(ranking032022, ranking062018, on =  :Pais)

nombres = ["United States","Iran","South Korea", "Ivory Coast",
           "DR Congo", "Cape Verde","Kyrgyzstan","North Korea",
           "Saint Kitts and Nevis", "Taiwan",
           "Saint Vincent and the Grenadines",
           "Saint Lucia", "Brunei", "Tonga", "Bahamas",
           "Somalia", "Eritrea", "Turks and Caicos Islands",
           "United States Virgin Islands", "Anguilla"]

for (i,j) in enumerate(cambiarNombre.Pais)
    ranking032022[findfirst(isequal(j), ranking032022.Pais),:Pais] = nombres[i]
end

comp032022 = leftjoin(elo032022, ranking032022, on = :Pais, makeunique=true)

# ### Bloque de código 3.59: Diagrama de dispersión para el puntaje Élő y el puntaje SUM FIFA al 30 de marzo de 2022

CairoMakie.activate!()
x = 700:20:1900
fig, ax, p = scatter(comp032022.Puntaje, comp032022.Puntaje_1;
                                axis = (; xlabel = "Puntaje SUM", 
                                ylabel = "Puntaje Élő"),
                                figure = (; resolution=(600, 600)))
text!("Brazil", position = (1920, 1816.67+40), 
      align = (:right, :center), color=:darkred, textsize = 13)
text!("Alemania", position = (1658.5, 1650.53-40), 
      align = (:left, :center), color=:darkred, textsize = 13)
text!("Colombia", position = (1595, 1600.52-20), 
      align = (:left, :center), color=:darkred, textsize = 13)
lines!(x, x, color =:darkred)
fig

# ### Bloque de código 3.60: Regresión lineal utilizando el *software* `R`

using RCall
R"lm(PM25purple ~ PM25aqs + humedad, data = $aqs)"
R"modelo = lm(PM25purple ~ PM25aqs + humedad, data = $aqs)
coef = modelo$coefficients
print(c(-coef[1]/coef[2], 1/coef[2],-coef[3]/coef[2]))
"

