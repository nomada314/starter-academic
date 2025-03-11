+++
date      = 2025-01-22
lastmod   = 2025-03-05
draft     = false
tags      = ["Teaching"]
title     = "Bases de datos"
math      = true
+++

### Horario

Martes 2:00 - 4:00 P.M. TBA <br>
Jueves 8:00 - 10:00 A.M. TBA

### Libro guía:

Ullman, J.D. & Widom, J. (2007) *[A First Course in Database Systems](https://www.pearson.com/en-us/subject-catalog/p/first-course-in-database-systems-a/P200000003302/9780136006374)*. Pearson

### Otras referencias:

* Rockoff, L. (2021) *The Language of `SQL`*. Addison-Wesley

### Horas de oficina: 

Lunes 8:00 - 10:00 A.M. o por cita. <br>
**Lugar**: La Colina Casa 2. 

### Evaluación

Proyectos (2): 80 %
Participación: 20 %


### Agenda

Semana | Fecha | Tema
---| --- | ----
1      | 02-11 | Presentación del curso.
&nbsp; | 02-13 | Modelos de datos <br> **Lectura**: 2.1 y 2.2 (págs. 14 -- 25) 
2      | 02-18 | Álgebra relacional <br> **Lectura**: 2.3 y 2.4.10 (págs. 25 -- 45) 
&nbsp; | 02-20 | Álgebra relacional, continuación <br> **Lectura**: 2.4.11 a 2.5 (págs. 46 -- 62) 
3      | 02-25 | Álgebra relacional, continuación <br> **Lectura**: 2.4.11 a 2.5 (págs. 46 -- 62) 
&nbsp; | 02-27 | Álgebra relacional, continuación <br> **Lectura**: 2.4.11 a 2.5 (págs. 46 -- 62) 
4      | 03-04 | Teoría de diseño <br> **Lectura**: 3.1 y 3.2 (págs. 63 -- 81) 
&nbsp; | 03-06 | Teoría de diseño, continuación <br> **Lectura**: 3.3 y 3.4 (págs. 81 -- 97) 
5      | 03-11 | E/R <br> **Lectura**: 4.1 - 4.3  
&nbsp; | 03-13 | E/R, continuación <br> **Lectura**: 4.4 - 4.10  
6      | 03-18 | .
&nbsp; | 03-20 | .
7      | 03-25 | .
&nbsp; | 03-27 | .
8      | 04-01 | Presentación proyecto I
&nbsp; | 04-03 | Presentación proyecto I, continuación

### Código 03-07

https://sqlime.org/

Cargar [Ventas.db](https://alexrojas.netlify.app/post/DB/Ventas.db)

```
select * from AGENTS
```

```
select a.WORKING_AREA, a.AGENT_NAME from AGENTS as a
```

```
select distinct o.AGENT_CODE from ORDERS as o
```

```
select a.AGENT_NAME as "Nombre", a.WORKING_AREA as "Ciudad" from AGENTS as a
```

```
select a.AGENT_NAME as "Nombre", a.WORKING_AREA as "Ciudad" from AGENTS as a
```

```
select a.AGENT_NAME as "Nombre",
        a.WORKING_AREA as "Ciudad",
        a.COMMISSION as "Comisión",
        (12*a.COMMISSION + .1) as "Comisión anual"
from AGENTS as a
```

```
select o.ORD_NUM as "Orden",
       o.AGENT_CODE as "Agente",
       o.ADVANCE_AMOUNT as "Avance",
       o.ORD_AMOUNT as "Total" 
from ORDERS as o
where o.ORD_AMOUNT*0.2 > o.ADVANCE_AMOUNT
```

```
select distinct o.AGENT_CODE as "Agente", o.ord_amount as "Total"
from ORDERS as o
where Agente='A002'
```

```
select o.ORD_NUM as "Orden",
       o.AGENT_CODE as "Agente",
       o.ADVANCE_AMOUNT as "Avance",
       o.ORD_AMOUNT as "Total" 
from ORDERS as o
where o.ORD_AMOUNT*0.2 > o.ADVANCE_AMOUNT
order by Total
```


```
select COUNT(*)
FROM (
  select o.ORD_NUM as "Orden",
       o.AGENT_CODE as "Agente",
       o.ADVANCE_AMOUNT as "Avance",
       o.ORD_AMOUNT as "Total" 
  from ORDERS as o
  where o.ORD_AMOUNT*0.2 > o.ADVANCE_AMOUNT
);
```


```
select o.ORD_NUM as "Orden",
       o.AGENT_CODE as "Agente",
       o.ADVANCE_AMOUNT as "Avance",
       o.ORD_AMOUNT as "Total" 
from ORDERS as o
where Avance between Total*0.21 and Total*0.39 
order by Total
```


### Código 03-11

https://dbdiagram.io/

```
Table Stars {
  name varchar [primary key]
  address varchar
}

Table Movie {
  title varchar [pk] 
  year integer [pk]
  length integer
  genre varchar
}

Table Studios {
  name varchar [primary key]
  address varchar
}


Ref "Starts-in": Stars.name <> Movie.title

Ref Owns:  Studios.name < Movie.title

```

<img src="http://infolab.stanford.edu/~ullman/fcdb/sevls/er_big.png" width=700>

<img src="http://infolab.stanford.edu/~ullman/fcdb/hernandez/ERdiagram.jpg" width=700>


