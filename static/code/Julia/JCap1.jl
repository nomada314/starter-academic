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

# ### Bloque de código 1.1: Variables booleanas

x = true
z = pi > 22/3

# ### Bloque de código 1.2: Uso del `;` para evitar la impresión en pantalla del resultado de un comando

x = true;
z = pi > 22/3;

# ### Bloque de código 1.3: Desbordamiento de tipo `Int32`

Int32(-2_147_483_648) - Int64(1)

Int32(-2_147_483_648) - Int32(1)

# ### Bloque de código 1.4: Operaciones con los dedos

✌ = 2;
✌ - ✌
✌ + ✌
✌/✌
✌^✌

# ### Bloque de código 1.5: Relación entre el número aúreo y su reciproco

ϕ = (1 + √5)/2;
Φ =  ϕ^-1;
println(Φ == ϕ - 1)
println(ϕ - Φ == 1)

# ### Bloque de código 1.6: Épsilon de máquina.

ϕ - 1 - eps(ϕ - 1)
ϕ - 1 + eps(ϕ - 1)

# ### Bloque de código 1.7: Secuencias de caracteres

pagina = "https://www.doi.org/";
Euler  = "La constante de Euler es \\gamma";
nombreConBP = "Introduccion_al_lenguaje_de_programacion";

# ### Bloque de código 1.8: Manipulación de la secuencia de caracteres `Euler`

Euler2 = replace(Euler, "\\gamma" => join((Char(0x03B3)," = ", MathConstants.γ + 0, "...")))

# ### Bloque de código 1.9: Manipulación de una secuencia de caracteres usando expresiones regulares

secOriginal = "Queremos  5  modificar  434 4  este   
me45ns6aje de tal  00     0    manera que no   
haya 98 espacios 2 extra    y que todos los 
554 2 98 digitos          
que se digiten sean eliminados ..."

secSinNumeros = replace(secOriginal,r"[0-9]" => "")

secSinMultiplesEspacios = replace(secSinNumeros, r" +" => " ")

secSinEspacioFinal= replace(secSinMultiplesEspacios, r" \n" => "\n")

secFinal= replace(secSinEspacioFinal, r"\n\s" => "\n")
print(secFinal)

# ### Bloque de código 1.10: Operadores aritméticos

x = 4; y = 3; z = 5

3x*y*z

3(x+1)y^2-z

# ### Bloque de código 1.11: Operadores de comparación y actualización

(x += 4, y -= 3, z *= 2)

1.25x == z

z != y

# ### Bloque de código 1.12: Definición de arreglos

mAny = Array{Any}(undef,(2,2))

mInt = Array{Int64}(undef,(3,4,2))

mAny[1,1] = 2; mAny[1,2] = .4; mAny[2,1] = "t"; mAny[2,2] = 'a'

mInt[1,1,1] = 3

vFlo = Vector{Float64}(undef,4)

mFlo = Matrix{Float64}(undef,3,3)

# ### Bloque de código 1.13: Arreglos digitados manualmente

vec1 = [10, 15, 18]

vec2 = [10; 15; 18]

vec3 = Int8[10, 15, 18]

mat1 = [10 15 18]

mat2 = [1 1 1; 1 3 9; 1 5 25]

mat3 = [[1 1 1]; [1 3 9]; [1 5 25]]

mat4 = Int16[[1, 1, 1] [1, 3, 9] [1, 5, 25]]

# ### Bloque de código 1.14: Cálculo del Laplaciano del grafo en la Figura 1.9

Adj = [0 1 1 0 0 0;
       1 0 1 0 0 0;
       1 1 0 1 0 1;
       0 0 1 0 0 0;
       0 0 0 0 0 0;
       0 0 1 0 0 0]

Grados = sum(Adj, dims = 2)

using LinearAlgebra
L = Diagonal(vec(Grados)) - Adj

# ### Bloque de código 1.15: Matrices con números aleatorios

mAleat1 = rand(Float64,(3,6))

mAleat1 = rand(3,6)

mAleat2 = 20mAleat1 - fill(10, (3,6))

mAleat3 = copy(mAleat2)

mAleat3[2,:] = zeros((1,6))

# ### Bloque de código 1.16: Instalación de los paquetes `Images`, `ImageMagick`, `ImageIO` y `FileIO`.

import Pkg
Pkg.add("Images")
Pkg.add(["ImageMagick", "ImageIO","FileIO"])

# ### Bloque de código 1.17: Lectura de una imagen

using Images, FileIO
conejo = load("../figs/panda0.jpg");

# También se puede descargar directamente de internet:
conejo = load("https://alexrojas.netlify.com/media/Julia/panda0.jpg");

conejo

# ### Bloque de código 1.18: Manipulación de la imagen en la Figura 1.10

size(conejo)

conejoCara = conejo[50:1700, 200:1300]

conejoPequeno = conejo[1:8:end, end:-8:1]

# ### Bloque de código 1.19: Manipulación de la imagen en la Figura 1.11 (B)

conejoCaleidoscopio = [conejoPequeno conejoPequeno[:,end:-1:1];
                       conejoPequeno[end:-1:1,:]
                       conejoPequeno[end:-1:1,end:-1:1]];
save( "./figs/conejoCaleidoscopio.pdf",conejoCaleidoscopio)

conejoCaleidoscopio

# ### Bloque de código 1.20: Operaciones *broadcasting*

a = reshape(1:12, (3,4,1))

c = fill(10,(4,)) .* reshape(1:5, (1,5))

b = reshape(c, (1,4,5))


resultado = a .+ b

# ### Bloque de código 1.21: Definición de la matriz de transición para el Ejemplo 1.6

using LinearAlgebra
N = 5
p = 0.4
d = zeros(N+1)
d[[1,N+1]] .= 1
d2 = fill(p, N)
d2[1] = 0
d1 = fill(1-p, N)
d1[N] = 0
P = Tridiagonal(d1,d,d2)

# ### Bloque de código 1.22: Cálculo del volumen de los cuerpos celestes en la Tabla 1.2

CuerposCelesteSS = [0.3300	4879	 5427	 3.7;
                    4.8700	12104	 5243	 8.9;
                    5.9700	12756	 5514	 9.8;
                    0.0730	3475	 3340	 1.6;
                    0.6420	6792	 3933	 3.7;
                 1898.0000	142984   1326	 23.1;
                  568.0000	120536   687	 9.0;
                   86.8000	51118	 1271	 8.7;
                  102.0000	49528	 1638	 11.0;
                    0.0146	2370	2095   0.7]
VolumenCCSS = 10^15*CuerposCelesteSS[:,1]./CuerposCelesteSS[:,3]

ValoresRel = CuerposCelesteSS./transpose(CuerposCelesteSS[3,:])

# ### Bloque de código 1.23: Manipulación de la imagen en la Figura 1.11 (B)

conejoEnmascarar = copy(conejoPequeno)
conejoEnmascarar[1:10:end,1:10:end] .= conejoPequeno[1,1];

conejoEnmascarar

# ### Bloque de código 1.24: Estimación de la probabilidad en el Ejemplo Agujas de Buffon

n, l, d = 10000, 10, 20
theta = (π/2)*rand(n);
puntoMedio = d*rand(n)/2;
cruce = 2puntoMedio .<  l*cos.(theta);
p = sum(cruce)/n;
println("Valor estimado de la probabilidad: ", p)

using Statistics
p = mean(cruce);

# ### Bloque de código 1.25: Generación de una imagen usando colores aleatorios

using Images

RGB.(mAleat1)

RGB.(mAleat1[1,:],mAleat1[2,:],mAleat1[3,:])

# ### Bloque de código 1.26: Uso de *broadcasting* para concatenear dos tuplas de cadenas de caracteres

nombreUsuario = ("Andrea", "Boris","Carla","Dana", "Ernesto")
apellidoUsuario = ("Alvarado", "Bernal","Castillo","Diaz", "Estrada")
usuario = lowercase.(nombreUsuario).*".".*lowercase.(apellidoUsuario)
correos = usuario.*"@".*"univ.edu.co"

# ### Bloque de código 1.27: Instalación del paquete `Plots` y `Makie`

Pkg.add("Plots")
Pkg.add("Makie")
Pkg.add("CairoMakie")
Pkg.add("GLMakie")
Pkg.add("WGLMakie")

# ### Bloque de código 1.28: Diagrama de líneas donde los puntos representan el punto medio de la aguja en el Ejemplo 1.9

using Plots
n = 10000
CordYmedio = rand([-1 1],n).*puntoMedio;
CordYmedio[1:5000] = CordYmedio[1:5000] .+ d;
CordXmedio = 60*rand(n) .- 30;
plot(CordXmedio[1:100], CordYmedio[1:100])

# ### Bloque de código 1.29: Diagrama de dispersión donde los puntos representan el punto medio de la aguja en el Ejemplo 1.9

plot(CordXmedio[1:100], CordYmedio[1:100], seriestype = :scatter, marker = :square, color = :darkred, legend=:top, label="Punto medio")


# ### Bloque de código 1.30: Diagrama de dispersión mejorado donde los puntos representan el punto medio de la aguja en el Ejemplo 1.9

using LaTeXStrings
plot(CordXmedio[1:100], CordYmedio[1:100], seriestype = :scatter, marker = :square, color = :darkred, legend=:top, label="Punto medio")
xlabel!(L"x")
ylabel!(L"y")
ylims!(5,32)
hline!([-10,10,30], label = "L\'ineas horizontales")
framestyle!(:none)

# ### Bloque de código 1.31: Gráfico de contornos de una distribución normal bivariada

x = -2.5:.1:2.5
n = length(x)
X = repeat(x, 1, n)
X1 = reshape(X,  1, n*n)
X2 = reshape(X', 1, n*n)
Z = pdf(MvNormal([0; 0],[1 -.5; -.5 1]), [X1;X2])
Plots.contour(x, x, Z, xlabel = L"x_1", ylabel = L"x_2")
annotate!(0, 0, Plots.text(L"\mu", :hcenter, :vcenter, 10))
annotate!(2.2, 2.2, Plots.text(L"f_{X,Y}(x,y)", :hcenter, :vcenter, 10))


# ### Bloque de código 1.32: Gráfico con múltiple líneas usando `CairoMalkie`

using CairoMakie
CairoMakie.activate!()
using LaTeXStrings
x = -1.5:0.05:1.5
fig, ax, p = lines(x, exp.(-x.^2); label = L"e^{-x^2}",
                                axis = (; xlabel = L"x", 
                                          ylabel = L"y"),
                                figure = (; resolution=(800, 600)))
lines!(x, 1 .- x.^2; label = L"1-x^2")
lines!(x, 1 .- x.^2 .+ x.^4 ./2; label = L"1-x^2+\frac{x^4}{2!}")
lines!(x, 1 .- x.^2 .+ x.^4 ./2 .- x.^6 ./factorial(3); 
                    label = L"1-x^2+\frac{x^4}{2!}-\frac{x^6}{3!}")
limits!(-1.5, 1.5, -1.25, 1.2)
axislegend(L"f(x)",position = :cb)
fig

# ### Bloque de código 1.34: Definición estructura `Binom`

struct Binom
    n::UInt
    p::Real
  end  

# ### Bloque de código 1.35: Definición dos variables de tipo `Binom`

b₁ = Binom(6,.4)
b₂ = Binom(10,.4)
typeof(b₁)
b₂.p

# ### Bloque de código 1.36: Definición del método `+()` para dos variables de tipo `Binom`

Base.:+(x::Binom,y::Binom) = Binom(x.n + y.n, x.p)
b₁ + b₂

# ### Bloque de código 1.37: Definición estructura `MezclaPoisson`

mutable struct MezclaPoisson
    λ::Real
    μ::Real
    p::Real
  end

sec1 = MezclaPoisson(3, 13, 0.4)
  

sec1.p = 0.3

# ### Bloque de código 1.38: Gráfica de la función de masa de probabilidad de una mezcla Poisson

using Distributions
x = 0:25
mezcla = sec1.p * pdf(Poisson(sec1.λ),x) + (1 - sec1.p)*pdf(Poisson(sec1.μ),x)
plot(x,mezcla, st = :sticks, m = 3, c= :green, xlabel = L"x", ylabel = "Densidad", label = L"\Pr(X=x|\lambda = 3, \mu = 13, p = 0.3)")

# ### Bloque de código 1.39: Definición estructura `Dual`

struct Dual <: Number
    a::Real
    a0::Real
end  

# ### Bloque de código 1.40: Definición de variables del tipo `Dual`

d1 = Dual(1, 1)
d2 = Dual(1.2, π)

# ### Bloque de código 1.41: Operaciones con números de tipo `Dual`

Dual(d1.a + d2.a, d1.a0 + d2.a0)

Dual(d1.a*d2.a, d1.a*d2.a0 + d1.a0*d2.a)

# ### Bloque de código 1.42: Definición de la suma y el producto de números de tipo `Dual`

Base.:+(x::Dual,y::Dual) = Dual(x.a + y.a, x.a0 + y.a0)
Base.:*(x::Dual,y::Dual) = Dual(x.a*y.a, x.a*y.a0 + x.a0*y.a)

println(d1 + d2)
println(d1*d2)

# ### Bloque de código 1.43: Creación del método para convertir un número de tipo `Real` a un número de tipo `Dual`

Base.:promote_rule(::Type{Dual}, ::Type{<:Real}) = Dual
Base.:convert(::Type{Dual}, x::Real) = Dual(x, zero(x))

# ### Bloque de código 1.44: Creación del método para mostrar en pantalla un número de tipo `Dual`

Base.:show(io::IO, x::Dual) = print(io,x.a," + ", x.a0, "⋅ϵ")

# ### Bloque de código 1.45: Definición de la resta y la división de números de tipo `Dual`

Base.:-(x::Dual,y::Dual) = Dual(x.a - y.a, x.a0 - y.a0)
Base.:/(x::Dual,y::Dual) = Dual(x.a/y.a, (y.a*x.a0 - x.a*y.a0)/y.a^2)

ϵ = Dual(0,1)

2 + 3ϵ

print(ϵ/(1-ϵ))
println( ϵ * ϵ)
