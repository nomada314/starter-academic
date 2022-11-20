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

# ### Bloque de código 2.2: Función para calcular la distancia euclidiana en $\mathbb{R}^n$.

function distanciaEuc(x,y)
  return sqrt(sum((x-y).^2)) 
end

distanciaEuc(3, 4)

distanciaEuc([2 4], [3 5])

distanciaEuc([2; 3; 4; 5], [3; 4; 5; 6])

# ### Bloque de código 2.3: Función para calcular la distancia euclidiana en $\mathbb{R}^n$ definida en línea

distanciaEuc(x,y) = sqrt(sum((x-y).^2))

# ### Bloque de código 2.4: Función para calcular la distancia euclidiana en $\mathbb{R}^n$ definida en línea con el símbolo de raíz cuadrada

distanciaEuc(x,y) =  √(sum((x-y).^2))

# ### Bloque de código 2.5: Función para calcular la distancia euclidiana en $\mathbb{R}^n$ definida en línea con el símbolo de sumatoria:∑

∑ = sum
distanciaEuc(x,y) =  √(∑((x-y).^2))

# ### Bloque de código 2.6: Función para calcular la distancia euclidiana entre un punto y varios puntos $\mathbb{R}^n$

distanciaEuc(x::Array,y::Array) =  .√(sum((x.-y).^2,dims=2))

# ### Bloque de código 2.7: Función para calcular la distancia euclidiana entre dos variables de tipo `MezclaPoisson`

mutable struct MezclaPoisson
    λ::Real
    μ::Real
    p::Real
end

vec(x::MezclaPoisson) = [x.p  x.λ  x.μ]
distanciaEuc(x::MezclaPoisson,y::MezclaPoisson) =  distanciaEuc(vec(x),vec(y))[1,1]

# Ejemplo
sec1 = MezclaPoisson(3, 5, .4)
sec2 = MezclaPoisson(4, 6, .3)
distanciaEuc(sec1, sec2)

# ### Bloque de código 2.8: Función para el cálculo de la presión de entrada de una solución salina usando la ley de Poiseuille.

presionEntrada(p1, Q) = 2672Q*10^5/(675π) + p1
presionEntrada(1066, 0.12)

# ### Bloque de código 2.9: Función para el cálculo de la presión de entrada de una solución salina usando la ley de Poiseuille y tomando la razón $Q = 0.12 \text{ cm}^3/\text{s}$.

presionEntrada(p1; Q = 0.12) = 2672Q*10^5/(675π) + p1

presionEntrada(1066)

presionEntrada(1066, Q = 0.06)

# ### Bloque de código 2.10: Función para el cálculo de la presión de entrada de una solución salina usando la ley de Poiseuille usando unidades físicas

using Pkg
Pkg.add("Unitful")

using Unitful
function presionEntrada(p1::Unitful.Pressure, Q::Unitful.VolumeFlow = 0.12u"cm^3/s")
  p2 = 8*1.002u"mPa*s"*2.5u"cm"*Q/(π*(0.150u"mm")^4) + p1
  return uconvert(u"Pa",p2)
end

presionEntrada(1066u"N/m^2")

presionEntrada(1066u"Pa")

presionEntrada(0.01066u"bar")

presionEntrada(1066u"atm"/101325)

# ### Bloque de código 2.11: Estimación de la probabilidad en el Ejemplo Agujas de Buffon.

function Buffon(n; d = 1, l = 0.8)
    theta = (π/2)*rand(n)
    x = d*rand(n)/2
    p = sum(2x .<  l*cos.(theta))/n
    return(p)
end  

Buffon(100000)

Buffon(d = 2, 100000)

Buffon(100000, l = 1, d = 2)

# ### Bloque de código 2.12: Cálculo de días entre dos fechas usando el método ordinario.

using Dates
"""
C\'alculo del n\'umero de d\'ias entre dos fechas f1 y f2,
usando el m\'etodo ordinario. Asume que la fecha f2 es
posterior a f1.
Argumentos:
    f1: objeto de tipo `Date`
    f2: objeto de tipo `Date`
Ejemplos:
    nDiasIntOrd(Date(2023,3,1),Date(2024,2,28))
    nDiasIntOrd(Date(2022,2,25),Date(2022,3,5))
"""
function nDiasIntOrd(f1::Date,f2::Date)
  M = 12(Dates.year(f2)-Dates.year(f1)) +
      (Dates.month(f2)-Dates.month(f1)) - 1
  delta = 30M + (30-Dates.day(f1)) + Dates.day(f2)
  return delta
end

nDiasIntOrd(Date(2022,2,25),Date(2022,3,5))

nDiasIntOrd(Date(2024,2,25),Date(2024,3,5))

nDiasIntOrd(Date(2022,1,15),Date(2024,6,26))

# ### Bloque de código 2.13: Cálculo de días entre dos fechas del tipo DateTime usando el método ordinario.

# +
function nDiasIntOrd(f1::DateTime,f2::DateTime)
    M = 12(Dates.year(f2)-Dates.year(f1)) +
        (Dates.month(f2)-Dates.month(f1)) - 1
    delta = 30M + (30-Dates.day(f1)) + Dates.day(f2)
    return delta
end
  
  
# -

nDiasIntOrd(DateTime(2022,2,25),DateTime(2022,3,5))

# ### Bloque de código 2.14: Diferencia finita central.

diferenciaCentral(f, x; h = 1e-5) = (f(x+h/2)-f(x-h/2))/h

f1(x) = 1/(x^3 - x^2)
diferenciaCentral(f1, 0.3)

diferenciaCentral( x -> 1/(x^3 - x^2), 0.3)

diferenciaCentral( x -> 1/(x^3 - x^2), 0.3, 1e-10)

diferenciaCentral(h = 1e-10, x -> 1/(x^3 - x^2), 0.3)

diferenciaCentral(x -> 1/(x^3 - x^2), h = 1e-12, 0.3)

diferenciaCentral( x -> 1/(x^3 - x^2), 0.3, h = 1e-17)

# ### Bloque de código 2.15: Estimación primera derivada usando un paso complejo.

difPasoComplejo(f, x; h = 1e-5) = imag(f(x+h*im))/h
difPasoComplejo( x -> 1/(x^3 - x^2), 0.3, h = 1e-17)

difPasoComplejo(f1, 0.3, h = 1e-9)

# ### Bloque de código 2.16: Definición de la suma en $\mathbb{Z}_5$

sumaZ5(x::Int64, y::Int64) = (x+y)%5
sumaZ5(2,4)

sumaZ5(x::Float64, y::Float64) = convert(Int64, round(x+y))%5

# ### Bloque de código 2.17: Definición de las funciones para calcular el valor esperado y varianza de variables de tipo `Binom`

struct Binomial
    n::Int
    p::Real
    Binomial(n,p) = (p > 1.0)|(p < 0) ? error("Probabilidad ∉ (0,1)") : new(n,p)
end

valorEsperado(x::Binom) = x.n*x.p

varianza(x::Binom) = x.n*x.p*(1-x.p)

# ### Definición de la función para calcular el valor esperado de $g(X)$ para variables del tipo `Binom`

using Distributions
function valorEsperado(x::Binomial, g)
  xs = 0:x.n
  xbinom = binomial.(x.n,xs).*(x.p.^xs).*((1-x.p).^(x.n.-xs))
  return sum(g.(xs).*xbinom)
end

valorEsperado(b₁,x -> (x-2.4)^2)

valorEsperado(b₁,x -> abs(x-2.4))

valorEsperado(b₁,x -> x^3)

# ### Bloque de código 2.19: Mapeo de funciones

nombreUsuario = ("Andrea", "Boris","Carla","Dana", "Ernesto")
apellidoUsuario = ("Alvarado", "Baron","Castillo","Diaz", "Estrada")
usuario = lowercase.(nombreUsuario).*".".*lowercase.(apellidoUsuario)
correos = usuario.*"@".*"univ.edu.co"

usuarios2 = map(x -> x[1:findfirst("@", x)[1]-1] , correos)

# ### Bloque de código 2.20: Definición del logaritmo y el recíproco para números de tipo `Dual`

# Definición estructura Dual
struct Dual <: Number
    a::Real
    a0::Real
end  
Base.:+(x::Dual,y::Dual) = Dual(x.a + y.a, x.a0 + y.a0)
Base.:*(x::Dual,y::Dual) = Dual(x.a*y.a, x.a*y.a0 + x.a0*y.a)
Base.:promote_rule(::Type{Dual}, ::Type{<:Real}) = Dual
Base.:convert(::Type{Dual}, x::Real) = Dual(x, zero(x))
Base.:show(io::IO, x::Dual) = print(io,x.a," + ", x.a0, "⋅ϵ")
Base.:-(x::Dual,y::Dual) = Dual(x.a - y.a, x.a0 - y.a0)
Base.:/(x::Dual,y::Dual) = Dual(x.a/y.a, (y.a*x.a0 - x.a*y.a0)/y.a^2)
ϵ = Dual(0,1);

Base.log(x::Dual) = Dual(log(x.a), x.a0/x.a)
Reciproco(x::Dual) = Dual(1/x.a, -x.a0/x.a^2)

# ### Bloque de código 2.21: Cálculo de la derivada por diferenciación automática de la función representada en la Figura 2.3.

x₀ = 1/4; y₀ = 2
# Derivada con respecto a x
x = Dual(x₀,1)
y = Dual(y₀,0)
println(x^3*log(x*y^2-Reciproco(y)))
# Derivada con respecto a y
x = Dual(x₀,0)
y = Dual(y₀,1)
print(x^3*log(x*y^2-Reciproco(y)))

# ### Bloque de código 2.22: Cálculo de la derivada por diferenciación automática de la función representada en la Figura 2.3 usando el paquete `ForwardDiff.jl`

using ForwardDiff
x = ForwardDiff.Dual(x₀,1)
y = ForwardDiff.Dual(y₀,0)
println(x^3*log(x*y^2- 1/y))

x = ForwardDiff.Dual(x₀,0)
y = ForwardDiff.Dual(y₀,1)
x^3*log(x*y^2- 1/y)

# ### Bloque de código 2.24: Opción de compra europea

function gananciaOpcionEuropea(st, s, x)
    if st > s
        out = st - s - x
    else
        out = -x
    end
    return out
end  

# ### Bloque de código 2.25: Código para obtener la Figura 2.5

using Plots
using LaTeXStrings
St = 100:122
plot(St,gananciaOpcionEuropea.(St,110,6), label = "", legend =:top)
xlabel!(L"S_T")
ylabel!("Ganancia")
hline!([0], c = :red, linestyle = :dot, label = "")

# ### Bloque de código 2.26: Función de densidad de probabilidad triangular

function pdfTriangular(x)
  if x < 0
    out = 0
  elseif x < 1
    out = x
  elseif x < 2
    out = 2 - x
  else
    out = 0
  end
  return out
end


# ### Bloque de código 2.27: Función de densidad de probabilidad triangular usando múltiples comparaciones

function pdfTriangular(x)
    if 0 < x ≤ 1
      out = x
    elseif 1 < x < 2
      out = 2 -x
    else
      out = 0
    end
    return out
end  

# ### Bloque de código 2.28: Función para calcular la distancia euclidiana entre un punto y varios puntos en $\mathbb{R}^p$ verificando la dimensión

function distanciaEuc(x::Array,y::Array)
    if size(x)[2] == size(y)[2]
      return(.√(sum((x.-y).^2,dims=2)))
    else
      error("Las dimensiones no son iguales")
    end
end  

# ### Bloque de código 2.29: Opción de compra europea usando la declaración `?-:`

function gananciaOpcionEuropea(st, s, x)
    return st > s ? st - s - x : -x
end  

# ### Bloque de código 2.30: Redefinición del método para mostrar en pantalla un número de tipo `Dual`



struct Dual <: Number
    a::Real
    a0::Real
end
Base.:+(x::Dual,y::Dual) = Dual(x.a + y.a, x.a0 + y.a0)
Base.:*(x::Dual,y::Dual) = Dual(x.a*y.a, x.a*y.a0 + x.a0*y.a)
Base.:promote_rule(::Type{Dual}, ::Type{<:Real}) = Dual
Base.:convert(::Type{Dual}, x::Real) = Dual(x, zero(x))
Base.:-(x::Dual,y::Dual) = Dual(x.a - y.a, x.a0 - y.a0)
Base.:/(x::Dual,y::Dual) = Dual(x.a/y.a, (y.a*x.a0 - x.a*y.a0)/y.a^2)
ϵ = Dual(0,1)
Base.:show(io::IO, x::Dual) = print(io,x.a," + ", x.a0, "ϵ")

1+ϵ

1-ϵ

Base.:show(io::IO, x::Dual) = print(io, x.a, x.a0 >= 0 ? " + " : " - ", abs(x.a0) == 1 ? "" : abs(x.a0), "ϵ")

1+ϵ

1-ϵ

1+0ϵ

# ### Bloque de código 2.31: Definición estructura binom verificando que `p` es mayor que 0 y menor que 1.
#

struct Binomial
    n::Int
    p::Real
    Binomial(n,p) = (p > 1.0)||(p < 0) ? error("Probabilidad ∉ (0,1)") : new(n,p)
end  

# ### Bloque de código 2.34: Función para estimar la integral definida usando la regla trapezoidal.

function trapezoildal(f, a, b; n = 100)
   Δ  = (b-a)/(n-1)
   particion = a:Δ:b
   resultado = f(a)/2
   for i ∈ 2:(n-1)
     resultado += f(particion[i])
   end
   resultado += f(b)/2
   return Δ*resultado
 end

trapezoildal(x -> x^2 + x - 2, 0,1)

# ### Bloque de código 2.35: Generación de todas las muestras de tamaño 4 sin reemplazamiento para una población de tamaño 10 y cálculo de la distribución muestral de la media.

alturas = [ 156 158 160 161 163 165 166 167 169 170]
muestras = fill(0,(210,4))
m = 1
for i in 1:7
  for j ∈ (i+1):8
    for k ∈ (j+1):9
      for l ∈ (k+1):10
        muestras[m,:] .= alturas[[i,j,k,l]]
        m += 1
      end
    end
  end
end

mediasMuestrales = sum(muestras, dims = 2)/4

using Plots
using LaTeXStrings
histogram(mediasMuestrales, nbins=20, c =:red, fillalpha = .2, legend = false, xlab = L"\overline{x}", ylab = "Conteos")

# ### Bloque de código 2.36: Generación de todas las muestras de tamaño 4 sin reemplazamiento para una población de tamaño 10.

m = 1
for i ∈ 1:7, j ∈ (i+1):8, k ∈ (j+1):9, l ∈ (k+1):10
  muestras[m,:] .= alturas[[i,j,k,l]]
  m += 1
end

# ### Bloque de código 2.37: Generación de todas las muestras de tamaño 𝑛 sin reemplazamiento para una población de tamaño $N$

function MuestrasSR(N, n)
    nMuestras = binomial(N,n)
    muestras =  fill(0,(nMuestras,n))
    for i in 1:n
        fila, valor =  0, i
        for j in 1:nMuestras
            fila += 1
            borde = binomial(N-t, n-i)
            if fila > borde
                fila = 1
                valor +=  1
            end
            if valor > N - n + i
                valor = muestras[j, i - 1] + 1
            end
            muestras[j, i] = valor
      end
    end
    return muestras
end  

# Muestras utilizando el paquete Combinatorics.jl
using Combinatorics
collect(combinations(1:5,3))

# ### Bloque de código 2.38: Simulación de una cadena de Markov continua

using Random
using LinearAlgebra
using InvertedIndices
using CairoMakie
using LaTeXStrings
function simulacionCMC(Q::Array; estadoInicial = NaN, n = 15, graficar=false)
    estados = zeros(Int8, n+1)
    tiempos = zeros(n+1)
    numeroEstados = size(Q,1)
    isnan(estadoInicial) ? estados[1] = rand(1:numeroEstados) : estados[1] = estadoInicial
    estadoActual = estados[1]
    for i in 1:n
        tasa = Q[estadoActual, :]
        tasaCero = (tasa .<= 0)
        Ts = randexp(numeroEstados-sum(tasaCero))./tasa[Not(tasaCero)]
        tiempos[i+1] = tiempos[i] + minimum(Ts)
        estadoActual = ((1:numeroEstados).*(1 .- tasaCero))[Not(tasaCero)][argmin(Ts)]
        estados[i+1] = estadoActual
    end
    if graficar
        figura = Figure()
        ax1 = Axis(figura[1, 1], xlabel = L"t", ylabel = "Estado")
        stairs!(figura[1, 1], tiempos , estados .- 1; step=:post,linestyle=:dot)
        scatter!(figura[1, 1], tiempos, estados .- 1)
        hidespines!(ax1)
        display(figura)
    end
    return (tiempos, estados)
end

# ### Bloque de código 2.39: Simulación del tamaño de la cola en la oficina de registro

using LinearAlgebra
a = Tridiagonal(fill(1/5,4),.-[1/4,9/20,9/20,9/20,1/5],fill(1/4,4))
xt = simulacionCMC(Array(a), estadoInicial = 1, graficar = true, n = 50)

# ### Bloque de código 2.40: Estimación de los parámetros en el modelo 1.3 para los datos en la Tabla 1.4 usando un ciclo `for`

function estimacionMezclaPoisson0(frec, θ::MezclaPoisson; mEstrella = 10)
    n = size(frec, 2)
    for i in 1:mEstrella
      p = θ.p; λ = θ.λ; μ = θ.μ
      λ₁ = (p*exp(-λ)).*(λ.^frec)
      μ₁ = ((1-p)*exp(-μ)).*(μ.^frec)
      z  = λ₁./(λ₁ .+ μ₁)
      p = sum(z)/n
      λ = sum(z.*frec)/sum(z)
      μ = sum((1 .-z).*frec)/sum(1 .-z)
      θ.p = p; θ.λ = λ; θ.μ = μ
    end
    return θ
  end  

# ### Bloque de código 2.41: Estimación de los parámetros en el modelo 1.3 para los datos en la Tabla 1.4 utilizando un ciclo `while`

function estimacionMezclaPoisson(frec, θ::MezclaPoisson; tol = 0.001)
    Δ = 10
    n = size(frec, 2)
    while(Δ > tol)
      p = θ.p; λ = θ.λ; μ = θ.μ
      λ₁ = (p*exp(-λ)).*(λ.^frec)
      μ₁ = ((1-p)*exp(-μ)).*(μ.^frec)
      z  = λ₁./(λ₁ .+ μ₁)
      p = sum(z)/n
      λ = sum(z.*frec)/sum(z)
      μ = sum((1 .-z).*frec)/sum(1 .-z)
      Δ = distanciaEuc(MezclaPoisson(λ, μ, p), θ)
      θ.p = p; θ.λ = λ; θ.μ = μ
    end
    return θ
end

# ### Bloque de código 2.42: Búsqueda aleatoria de un mínimo local de una función

using Distributions
function busquedaAleatoria(f, xb, n; tol = 1e-8, vtol = 1e-4, maxiter = 1000, σ²₀ = 1.0, η = 0.9)
  # Inicializaci\'on del n\'umero de iteraciones y asignaci\'on de las
  # variables que controlan el algoritmo
  iteraciones, sinMejoras = 0, 0
  σ² = σ²₀              
  fb, xnuevo = Inf, xb    # fb se inicializa con un valor infinito
                          # para garantizar que el ciclo inicie
  fnuevo = f(xnuevo)
  while (iteraciones ≤ maxiter && (fb - fnuevo > tol || σ² > vtol))
  # Mientras que no se llegue al n\'umero m\'aximo de iteraciones y no
  # cambie el valor de la funci\'on en una valor superior a tol o la
  # varianza sea menor a vtol se ejecutan los siguientes comandos
    fb = fnuevo
    x = rand(MvNormal(xb, σ²),n)
    valoresF = mapslices(f, x, dims = [1])
    (fnuevo, i) = findmin(valoresF)
    if(fnuevo > fb)
      sinMejoras += 1
      fnuevo = fb
    else
      xb = x[:,i[2]]
      sinMejoras = 0
    end
    if (sinMejoras > 9)
      σ² *= η
    end
    iteraciones += 1
  end
  return(minimo = xb, fminimo = fb, iteraciones)
end

# ### Bloque de código 2.43: Búsqueda aleatoria de mínimos locales y máximo local de la función de Himmelblau

Himmelblau(x) = (x[1]^2 + x[2] - 11)^2 + (x[1]+x[2]^2-7)^2
busquedaAleatoria(Himmelblau,[0,3.0], 200, σ²₀ = 2.0)

busquedaAleatoria(x -> -Himmelblau(x),[0,0], 200, σ²₀ = 0.2)

# ### Bloque de código 2.44: Función de Himmelblau con contornos

using GLMakie
GLMakie.activate!()
xs = -5:.1:5
ys = -5:.1:5
zs = [himmelblau([x,y]) for x in xs, y in ys]
fig = Figure(resolution=(1200, 800), fontsize=26)
ax1 =  Axis3(fig[1, 1]; aspect=(1, 1, 1), elevation = pi/8,
        xzpanelcolor=:grey25, perspectiveness = 0.5,
        yzpanelcolor = :black, zgridcolor = :grey70,
        ygridcolor = :grey70, xgridcolor = :grey70)
ax2 = Axis(fig[1, 3]; aspect = DataAspect())
surface!(ax1, xs, ys, zs; colormap=(:Spectral_11,0.75), shading=false)
contour3d!(ax1, xs, ys, zs; colormap=:Spectral_11, levels=20, linewidth=2)
contour!(ax1, xs, ys, zs; colormap=:Spectral_11, levels=50, transformation=(:xy, -50))
s = contourf!(ax2, xs, ys, zs; colormap=:Spectral_11, levels=50)
Colorbar(fig[1, 2], s, width=15, ticksize=15, tickalign=1, height=Relative(0.66))
fig


# ### Bloque de código 2.45: Cálculo del gradiente usando diferenciación automática

using LinearAlgebra
function gradianteDual(f,x)
  p = size(x,1)
  a = Dual.(x, I(p))
  val = mapslices(f, a, dims = 1)
  return vec([i.a0 for i in val])
end  

# ### Bloque de código 2.46: Gradiente descendente utilizando diferenciación automática

using LinearAlgebra
function gradienteDescendente(f, xb; η = 1, tol = 1e-8, xtol = 1e-4, gtol = 1e-6, maxiter = 1000)
  iteraciones, sinMejoras,mejoro = 0, 0, 0
  cambioX, cambioF = Inf, Inf
  nG = norm(gradianteDual(f,xb))
  fb = f(xb)
  while (iteraciones ≤ maxiter && (cambioF > tol || cambioX > xtol || nG > gtol))
    g = gradianteDual(f,xb)
    xnuevo = xb - η*g
    fnuevo = f(xnuevo)
    if (fnuevo ≥ fb)
      η /= 2
      mejoro = 0     
      sinMejoras += 1
      if (sinMejoras > 9)
        break
      end
    else
      sinMejoras = 0
      mejoro += 1
      if (mejoro > 4)
        η *= 2
        mejoro = 0
      end
      cambioX = norm(xnuevo - xb)
      cambioF = abs(fnuevo - fb)
      xb = xnuevo
      fb = fnuevo
    end
    iteraciones += 1
  end
  return(minimo = xb, fminimo = fb, iteraciones)
end

# ### Bloque de código 2.47: Evaluación de la expresión a = h*b/2

expresion = :(a = (b * h) / 2)

b, h = 2, 3
eval(expresion)

# ### Bloque de código 2.49: Macro para nombrar una función

macro nombrarOper(nombref, exponente)
    :(
      function $nombref(a, b)
        a + b^$exponente
      end     
    )
  end  

@nombrarOper s3 3

@nombrarOper spi π

# ### Bloque de código 2.50: Macro para nombrar una función usando `quote`

macro nombrarOper(nombref, exponente)
    quote
      function $(esc(nombref))(a, b)
        a + b^$(esc(exponente))
      end     
    end
  end  

# ### Bloque de código 2.51: Mutable vs. no mutable

tupla =  [(rand(), rand()) for _ in 1:1000]
arreglo = [[rand(), rand()] for _ in 1:1000]
function producto(x)
    [i .- j for i in x, j in x]
end


print("Operación con tupla")
@time producto(tupla)

print("Operación con arreglo")
@time producto(arreglo)

# ### Bloque de código 2.52: Función para calcular la distancia euclidiana entre un punto y varios puntos en $\mathbb{R}^p$ verificando la dimensión con la macro `@assert`

function distanciaEuc(x::Array,y::Array)
    @assert size(x,2) == size(y,2) "Las dimensiones no coinciden"
    return .√(sum((x.-y).^2,dims=2))
end  

# ### Bloque de código 2.53: Simulación de una cadena de Markov continua usando `@assert`

using InvertedIndices
function obtenerParametros(qi::Vector)
    numeroEstados = size(qi,1)
    tasaCero = (qi .<= 0)
    qij = qi[Not(tasaCero)]
    estadoT = ((1:numeroEstados).*(1 .- tasaCero))[Not(tasaCero)]
    return qij, estadoT, size(qij,1)
end

# ### Bloque de código 2.54: Encontrar los parámetros de una cadena de Markov continua

# +
using Random
using LinearAlgebra
using InvertedIndices
using CairoMakie
using LaTeXStrings

function simulacionCMC(Q::Array; estadoInicial = NaN, T = 60, graficar=false)
    numeroEstados = size(Q,2)
    cond1 = sum(Q, dims = 2) == zeros(numeroEstados,1)
    cond2 = -2 .*diag(Q) == reshape(sum(abs.(Q), dims = 2),(numeroEstados,))
    cond3 = sum(diag(Q) .< 0) == numeroEstados
    @assert cond1 & cond2 & cond3 "La matriz dada no es una matriz generadora"
    isnan(estadoInicial) ? estados = [rand(1:numeroEstados)] : estados = [estadoInicial]
    estadoActual = estadoInicial
    @show parametros = mapslices(obtenerParametros, Q, dims = 2)
    TiempoTotal = 0.0
    tiempos = [TiempoTotal]
    while TiempoTotal < T
        Ts = randexp( parametros[estadoActual][3] )./parametros[estadoActual][1]
        TiempoTotal += minimum(Ts)
        estadoActual = parametros[estadoActual][2][argmin(Ts)]
        push!(estados,estadoActual)
        push!(tiempos,TiempoTotal)
    end
    if graficar
        figura = Figure()
        ax1 = Axis(figura[1, 1], xlabel = L"t", ylabel = "Estado")
        stairs!(figura[1, 1], tiempos , estados .- 1; step=:post,linestyle=:dot)
        scatter!(figura[1, 1], tiempos, estados .- 1)
        hidespines!(ax1)
        display(figura)
    end
    return (tiempos, estados)
end
# -

# ### Bloque de código 2.55: Uso básico de la función `Animation()` y `frame()`

using Plots, Images
using LaTeXStrings
n = 49
β₀, β₁, β₂ = 1.2, -2.1, 0.8
xi = 7 .*rand(n)
primeraAnimacion = Plots.Animation()
for i in 1:5
    yi = β₀ .+ β₁ .*xi .+  (β₂ .* xi .^2) .+  2 .*randn(n)
    scatter(xi, yi, color = RGB(i/5,1 - i/5, 1/5), legend = :none, ylims = (-7,25))
    xlabel!(L"x")
    ylabel!(L"y")
    savefig("FFF"*string(i)*".pdf")
    frame(primeraAnimacion)
end
gif(primeraAnimacion, "regresionLineal.gif", fps = 2)

# ### Bloque de código 2.56: Uso de la función `Animation()` y `frame()`

using LaTeXStrings
using Plots
x = -1.2:0.01:1.2
animacion = Plots.Animation()
plot(x, x -> exp(-x^2), color = RGB(1,.5,.5), legend = :none)
annotate!(0, .9, text(L"e^{-x^2}", :hcenter, :vcenter, 10))
xlabel!(L"x")
ylabel!(L"f(x)")
aproximacion = x.^0
texto = "1"
for i in 1:10
    texto0 = "\\frac{x^{"*string(2i)*"}}{"*string(i)*"!}"
    texto *= iseven(i) ? "-"*texto0 : "+"*texto0
    textoF = "\$"*texto*"\$"
    aproximacion .+= ((-1)^i).*(x.^(2i))./factorial(i)
    plot!(x, aproximacion, color = RGB(1-i/10,.5,.5+i/20))
    annotate!(0, .9 - i/8, text(textoF, 6))
    frame(animacion)
end
gif(animacion, "expx2Taylor.gif", fps = 1)

# ### Bloque de código 2.57: Animación de la búsqueda aleatoria de un mínimo local de una función en dos dimensiones

using Plots
using Distributions
function animacionBusquedaAleatoria(f, xb, n; tol = 1e-8, vtol = 1e-4, maxiter = 1000, σ²₀ = 1.0, η = 0.9, rangoX =[xb[1]-3*sqrt(σ²₀),xb[1]+3*sqrt(σ²₀)], rangoY = [xb[2]-3*sqrt(σ²₀),xb[2]+3*sqrt(σ²₀)])
  @assert size(xb,1)==2 "Solamente funciona para dos dimensiones"
  iteraciones, sinMejoras = 0, 0
  σ² = σ²₀
  fb, xnuevo = Inf, xb
  fnuevo = f(xnuevo)
  xs = range(rangoX[1],rangoX[2], length=101)
  ys = range(rangoY[1],rangoY[2], length=101)
  fig0 = Plots.contour(xs,ys,(xs,ys) -> log(f([xs,ys])))
  animacion = Plots.Animation()
  while (iteraciones ≤ maxiter && (fb - fnuevo > tol || σ² > vtol))
    fb = fnuevo
    x = rand(MvNormal(xb, σ²),n)
    fig = deepcopy(fig0)
    Plots.scatter!(fig, x[1,:], x[2,:], markercolor=:black, markeralpha=0.3, legend=false,xlims=rangoX, ylims=rangoY)
    valoresF = mapslices(f, x, dims = [1])
    (fnuevo, i) = findmin(valoresF)
    if(fnuevo > fb)
      sinMejoras += 1
      fnuevo = fb
    else
      xb = x[:,i[2]]
      sinMejoras = 0
      Plots.scatter!(fig, [xb[1]], [xb[2]], markercolor=:red, markeralpha=0.9, legend=false)
    end
    if (sinMejoras > 9)
      σ² *= η
    end
    iteraciones += 1
    Plots.frame(animacion)
  end
  return(minimo = xb, fminimo = fb, iteraciones, animacion,fig0)  
end

animacionHimmelblau = animacionBusquedaAleatoria(Himmelblau,[0,2], 200, σ²₀ = 5)
gif(animacionHimmelblau[4], "busquedaAleatoriaHimmelblau.gif", fps=5)

# ## Problema central: modelo de ramificación de una neurona

using SparseArrays
using InvertedIndices
using CairoMakie
CairoMakie.activate!()

function distanciaEuc(x::Array,y::Array)
    @assert size(x,2) == size(y,2) "Las dimensiones no coinciden"
    return .√(sum((x.-y).^2,dims=2))
end

# ### Bloque de código 2.58: Definición del tipo `Neurona`

using SparseArrays
struct Neurona
    n::Int64                               # N\'umero de puntos en P
    A::SparseMatrixCSC{Bool}               # Matriz de adyacencia
    p::Matrix{Real}                        # Posiciones
    Neurona(n,A,p) = n < 1 ? error("Se necesita al menos un nodo") : new(n, A, p)
    Neurona(n,A,p) = size(A) != (n,n) ? error("Se requiere una matriz de dimension "*string(n)*" x "*string(n)) : new(n,A,p)
    Neurona(n,A,p) = size(p) != (n,2) ? error("Se requiere una matriz de dimension "*string(n)*"x 2") : new(n,A,p)
end

# ### Bloque de código 2.59: Método de la función `crearNeurona()` para un conjunto de puntos dados

function crearNeurona(p::Matrix; b = 0.5)
    r = adyacencia(p, b)
    return r
end

# ### Bloque de código 2.60: Método de la función `crearNeurona()` generando 𝑛 puntos al azar

function crearNeurona(n::Int64; b = 0.5, d₀ = "unif", μ₀ = 0, σ₀ = 10)
    p = puntosAzar(n, d = d₀, μ = μ₀, σ = σ₀)
    r = adyacencia(p, b)
    return r
end

# ### Bloque de código 2.61: Función para crear 𝑛 puntos aleatorios en $\mathbb{R}^2$

function puntosAzar(n::Int64; d = "unif", μ = 0.0, σ = 10.0)
    θ = 2π*rand(n)          # \'Angulos aleatorios
    if d == "unif"
        r = σ*rand(n) .- μ  # Radios aleatorios
    else
        r = μ .+ σ*randn(n)    
    end
    xy = hcat(r.*cos.(θ),r.*sin.(θ))
    return xy
end

# ### Bloque de código 2.62: Cálculo de la matriz de adyacencia en el modelo de ramificación propuesto por Cuntz et al. (2007)

function adyacencia(p::Matrix, b::Float64)
    n = size(p,1)
    A = spzeros(n+1,n+1)
    d0 = distanciaEuc([0 0],p)
    dist = (1+b) .* d0
    masCercano = findmin(dist)
    puntoMasCercano = masCercano[2][1] 
    nodoEntrante = puntoMasCercano + 1 
    dist[puntoMasCercano,1] = Inf
    A[1, nodoEntrante] = 1
    padres = [1]
    hijos = [nodoEntrante]
    distCamino = d0[:,1]    
    for _ in 1:(n-1)
        d1 = distanciaEuc(reshape(p[puntoMasCercano,:],(1,2)), p)
        dist = hcat(dist, d1  .+  b .* ( d1 .+ distCamino[puntoMasCercano]))
        dist[hijos .- 1, end] .= Inf 
        masCercano = findmin(dist)
        puntoMasCercano = masCercano[2][1]
        nodoEntrante = puntoMasCercano + 1
        nodoPadre = masCercano[2][2] == 1 ? 1 :  hijos[masCercano[2][2]-1]
        A[nodoPadre, nodoEntrante] = 1   
        dist[puntoMasCercano, 1:end] .= Inf; 
        push!(hijos, nodoEntrante)
        push!(padres, nodoPadre)       
        if nodoPadre > 1
            d2 = distanciaEuc(reshape(p[nodoPadre-1,:],(1,2)), reshape(p[nodoEntrante-1,:],(1,2)))
            distCamino[puntoMasCercano] = distCamino[nodoPadre-1] + d2[1,1]
        end
    end
    return Neurona(n+1, A, vcat([0 0], p))
end

# ### Bloque de código 2.63: Función para gráficar la ramificación de una variable tipo `Neurona`

using CairoMakie
CairoMakie.activate!()
function dibujarNeurona(x::neurona)
    fig, ax, p = scatter(x.p[:,1],x.p[:,2]; markersize=4, 
                        color = :black,
                        figure=(; resolution=(400, 400)),
                        axis=(; aspect=DataAspect()))
    hidespines!(ax)
    hidedecorations!(ax)
    conecciones = findnz(x.A)
    enlaces = size( conecciones[1], 1)
    for i in 1:enlaces
        e = [ conecciones[1][i], conecciones[2][i] ]
        lines!(x.p[e,1],x.p[e,2]; color = :black)
    end
    fig
end

n0 = crearNeurona(200, μ₀ = -10, σ₀ = 20, b = 1.2);

dibujarNeurona(n1)
