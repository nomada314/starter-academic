+++
date      = 2025-01-22
lastmod   = 2025-03-05
draft     = true
tags      = ["Teaching"]
title     = "Bases de datos"
math      = true
+++

### Horario

Martes 2:00 - 4:00 P.M. TBA <br>
Jueves 8:00 - 10:00 A.M. TBA

### Libros guía:

Ullman, J.D. & Widom, J. (2007) *[A First Course in Database Systems](https://www.pearson.com/en-us/subject-catalog/p/first-course-in-database-systems-a/P200000003302/9780136006374)*. Pearson


Bradshaw, S., Brazil, E. & Chodorow, K. *MongoDB The Definitive Guide*. O'Reilly.


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
6      | 03-18 | Día cívico <br> **Lectura**: 6.1 - 6.3
&nbsp; | 03-20 | SQL <br> **Lectura**: 6.4 - 6.5
7      | 03-25 | SQL, continuación <br> **Lectura**: 6.6
&nbsp; | 03-25 | SQL, continuación
8      | 04-01 | SQL, continuación
&nbsp; | 04-03 | SQL, continuación
9      | 04-08 | Presentación proyecto I
&nbsp; | 04-10 | Presentación proyecto I, continuación
10     | 04-22 | `pandas`
&nbsp; | 04-24 | `pandas`, continuación
11     | 04-29 | `pandas`, continuación
&nbsp; | 05-01 | Festivo
12     | 05-06 | `pandas`, continuación
&nbsp; | 05-08 | MongoDB <br> **Capítulos**: 2 y 3
13     | 05-13 | MongoDB <br> **Capítulo**: 4
&nbsp; | 05-15 | MongoDB <br> **Capítulo**: 5
14     | 05-20 | MongoDB <br> **Capítulo**: 6
&nbsp; | 05-22 | .
15     | 05-27 | .
&nbsp; | 05-29 | Presentación proyecto II
16     | 06-03 | Presentación proyecto II, continuación
&nbsp; | 06-09 | Presentación proyecto II, continuación



### Código 03-07

https://sqlime.org/

Cargar [Ventas.db](https://alexrojas.netlify.app/Data/DB/Ventas.db)

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

### 03-13


<img src="https://alexrojas.netlify.app/media/DB/Ch.png" width=800>

[Chinook.db](https://alexrojas.netlify.app/Data/DB/Chinook.db)

### 03-25

```
select Name
from Playlist, (
  select Id, max(conteos)
  from (
    select PlaylistId Id, count(*) conteos
    from PlaylistTrack
    group by PlaylistId
    )
  )
where PlaylistId = Id
```

### 04-10

Karen:
https://dbdiagram.io/d/TEJIDOS-67f5360e4f7afba184cdc847


Leidy:
[Diagrama](https://alexrojas.netlify.app/media/DB/DISTRIBUIDORA.pdf)

Ivan:
<img src="https://alexrojas.netlify.app/media/DB/Pinturas.png" width=800>

Adrian:
<img src="https://alexrojas.netlify.app/media/DB/Universidad.jpg" width=800>

Daniel:
[Diagrama](https://alexrojas.netlify.app/media/DB/Pdf_Diagrama.pdf)

### 05-15

```{python}
import urllib
import pandas as pd
from bs4 import BeautifulSoup

import ssl
ssl._create_default_https_context = ssl._create_unverified_context


mat = 'https://www.uptc.edu.co/sitio/portal/sitios/universidad/vic_aca/facultades/fac_ciencias/preg/cie_52322_t/03_docth.html'

with urllib.request.urlopen(mat) as respuestaURL:
     matSoup = BeautifulSoup(respuestaURL)

matRH = matSoup.find_all("a","{"title":"CvLAC"})


matRH = [m['href'][-10:] for m in matRH]

matRH[11] = '0000548618'

matRH.pop(0)

```

```{python}
def eliminarBordes(texto, frase):
    f1Ocurrencia = texto.find(frase) + len(frase)
    i2Ocurrencia = texto.find(frase, f1Ocurrencia)
    if i2Ocurrencia == -1:
        i2Ocurrencia = len(texto)
    return(texto[f1Ocurrencia:i2Ocurrencia])

def infoArt(r):
    titulo = eliminarBordes(r,'"')
    revista = eliminarBordes(r,'@@ ')
    inicio = r.find('ISSN:')
    issn = r[(inicio + 6):(inicio + 15)]
    inicio = r.find('DOI:')
    agno = r[(inicio-6):(inicio-2)]
    inicio = r.find('ed: ')
    final = r.find('v.')
    editorial = r[(inicio+4):(final-1)]
    final = r.find('"')
    autores = r[:(final-2) ]
    inicio = r.find('. En: ')
    final = r.find('@@')
    pais = r[(inicio+6):final]
    nAutores = len(autores.split(','))
    return (issn, agno, revista, editorial, pais,titulo, autores, nAutores)

def obtenerArticulos(rh):
    base = 'https://scienti.minciencias.gov.co/cvlac/visualizador/generarCurriculoCv.do?cod_rh='
    cv = base + rh
    with urllib.request.urlopen(cv) as respuestaURL:
        cvSoup = BeautifulSoup(respuestaURL)
    info = cvSoup.find_all("table", {"style": "border:#999 1px solid"})
    articulos = [tabla.find_all("blockquote") for tabla in info[1:] if tabla.h3.text=='Artículos']
    if len(articulos) > 0:
      articulos = [articulo.text for articulo in articulos[0] ]
      articulos = [articulo.replace('\xa0\r\n', '@@') for articulo in articulos ]
      articulos = [' '.join(articulo.split()) for articulo in articulos]
      articulos = [articulo.replace('""','"') for articulo in articulos]
      artModificado = [infoArt(articulo) for articulo in articulos]
      artCvLAC = pd.DataFrame(artModificado, columns = ['issn', 'agno', 'revista', 'editorial', 'pais', 'titulo', 'autores','n'])
      artCvLAC = artCvLAC.sort_values(by=['agno'])
    else:
      artCvLAC = None
    return artCvLAC


```

```{python}
matArt = [obtenerArticulos(m) for m in matRH ]
```

## 05/20

```{python}
def getInfo(d):
  with urllib.request.urlopen(d) as respuestaURL:
    l = BeautifulSoup(respuestaURL)
  resumen = l.find("div",{"class":"description-wrapper"}).find_all("p")[1].text
  citacion = l.find("div",{"class":"col-md-12 ui-cite item-citation"}).find("p")
  titulo = citacion.find("i").text
  autores = [m.find("p").text for m in l.find_all("div",{"class":"sa-panel-heading3"})]
  palabras = [x.text for x in l.findAll('a', href=lambda x: x and x.startswith('/catalogsearch/advanced/result/?products_keywords='))]
  doi = [x['href'] for x in l.findAll('a', href=lambda x: x and x.startswith('https://doi.org/'))][0]
  metaData = l.find_all("div",{"class":"product-info-metadata"})
  mdNombres = [[f.text for f in x.find_all("strong") if f.text!="DOI:"] for x in metaData]
  mdValor = [[f.text for f in x.find_all("span")] for x in metaData]
  mD = [dict(zip(i,j)) for i,j in zip(mdNombres,mdValor)]
  ISBN = [x['ISBN-13:'] for x in mD]
  año = int(mD[0]['Fecha de publicación:'])
  try:
    precio = [float(x['Precio: '][5:])*1000 for x in mD]
  except:
    precio = [0]
  d = {"titulo":titulo, "autores":autores,"doi":doi,"ISBN":ISBN, "Año":año, "Precio":precio, "resumen":resumen, "palabras":palabras}
  return d
```



