#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Created on Thu Apr  9 20:15:23 2020
@author:
"""

##################################################
### Manipulación y visualización de datos
##################################################

import math
import numpy as np
import numpy.linalg as nl
import matplotlib as mpl
import matplotlib.pyplot as plt
import pandas as pd
import seaborn as sns
sns.set_style("white")
plt.rcParams['font.family'] = 'serif'
plt.rcParams['figure.figsize'] = (12.0, 12.0)
plt.rcParams['font.size'] = 18
mpl.rcParams['mathtext.fontset'] = 'cm'
mpl.rcParams['mathtext.rm'] = 'serif'


paginaD = 'Datos/'
direccion = paginaD + '<nombrearchivo>'

##################################################
## Objetos `pandas`
##################################################

import pandas as pd
import numpy as np
CantidadesCompra = pd.Series([6,6,12,12,12,12,24,10,10,4,12,12,
                              12,12],
                              ["22809","84347", "84945","22242",
                              "22244", "22243", "47421", "20712",
                              "20713","22837", "22969", "22973",
                              "84569B", "22549"])

CantidadesCompra.values
CantidadesCompra.index
CantidadesCompra['22837']

CantidadesCompra['22242':'22243']
CantidadesCompra[['22242','22244','22243']]

CantidadesCompra[9]
CantidadesCompra[3:6]

glucosa = pd.Series([6.1, 6.5, 6.7, 5.0, 4.9, 6.1, 4.9, 6.6,
                     4.1, 6.9, 5.6, 8.1, 6.3, 6.9, 10.9, 5.2,
                     7.1, 4.9, 5.5, 5.6, 7.1, 5.9, 6.6, 4.1,
                     5.9, 7.6, 5.1, 5.0])

diaYhora = pd.date_range('2020-10-01 06:00:00', periods = 28,
freq = '8H')
glucosa.index = diaYhora


BWexp = pd.DataFrame({'Ei':range(0,201,25),
                      'fobs':[10.6, 16.0, 45.0, 83.5, 52.8, 19.9,
                             10.8, 8.25, 4.7],
                     'Error':[ 9.34, 17.9, 41.5, 85.5, 51.5, 21.5,
                               10.8, 6.29, 4.14]})

BWexp1 = pd.DataFrame([[0, 10.6, 9.34], [25, 16.0, 17.9],
                       [50, 45.0, 41.5], [75,83.5,85.5],
                       [100, 52.8, 51.5], [125, 19.9,21.5],
                       [150, 10.8, 10.8], [175, 8.25, 6.29],
                       [200, 4.7, 4.14]],
                       columns=["Ei","fobs","Error"])

Audaz = pd.read_csv(paginaD+'Gasparini.csv')

archivo = 'FWF.dat'
FWF = pd.read_fwf(paginaD+archivo,
                names=['Item','Nombre','Inferior','Superior'],
                colspecs=[(0,13),(14,24),(25,29),(30,34)])


ws0 = pd.read_table('http://lib.stat.cmu.edu/datasets/wseries',
                  skiprows=34, nrows=23, sep='\t\s\s|\s\s',
                  header=None)

pulsar = pd.read_fwf(paginaD+'pulsar.txt', header=None,\
                     na_values ='*', skiprows=5,\
                     names=['Nombre','R','D','P','Dist'],\
                         colspecs=[(6,19),(31,48),(51,69),\
                         (72,95),(111,118)])
pulsar = pulsar.dropna(how='all')


wiki = 'https://en.wikipedia.org/wiki/'
sa  = '2020_coronavirus_pandemic_in_South_America'
Covid = pd.read_html(wiki+sa,match='Countries and territories')[0]


Audaz.info()
Audaz.sample(5)
Audaz.head(5)


!head -n 6 <dirección archivo>
!tail -n 7 <dirección archivo>


Audaz = pd.read_csv(paginaD+'Gasparini.csv', usecols=range(3,8),\
                    names = ['id', 'coraje', 'exploracion',\
                             'conteo', 'velocidad'],header = 0)


import seaborn as sns
planets = sns.load_dataset('planets')
planets.info()


pd.read_csv(<archivo>, delimiter=";", decimal=",")


##################################################
### Estadísticas descriptivas
##################################################

glucosa.min(), glucosa.median(), glucosa.mean(), glucosa.max()
glucosa.std()
glucosa.quantile([.2,.4,.6,.8])

glucosa.describe()


fig = plt.figure(figsize=(12, 12))
fig.subplots_adjust(hspace=0.4, wspace=0.4)
ax1 = fig.add_subplot(211)
ax1.set_ylabel('Glucosa (mmol/L)',fontsize=14)
ax2 = fig.add_subplot(234)
ax2.set_ylabel('Glucosa (mmol/L)',fontsize=14)
ax3 = fig.add_subplot(235)
ax4 = fig.add_subplot(236)
glucosa.plot(ax=ax1, kind='line', title='Serie de tiempo',
             x_compat=True)
glucosa.plot(ax=ax2, kind='box', title='Diagrama de caja')
glucosa.plot(ax=ax3, kind='hist', title='Histograma')
glucosa.plot(ax=ax4, kind='kde', title='Densidad estimada')


planets.describe()

planets.dropna().describe()


planetasNoFaltantes = planets.dropna()
planetasNoFaltantes.describe()


import seaborn as sns
sns.distplot(Audaz['velocidad'], color="gray")


# Tiempo promedio entre pulsos
pulsar['P'].mean()
# Púlsar con mayor tiempo entre pulsos
pulsar.iloc[pulsar['P'].argmax(),0]
pulsar['P'].max()
# Púlsar con menor tiempo entre pulsos
pulsar.iloc[pulsar['P'].argmin(),0]
pulsar['P'].min()


##################################################
### Selección y filtración
##################################################


Covid.columns
Covid.index

Covid.columns = ['Pais', 'Confirmados', 'Muertes',\
                 'Recuperados','Ref']

Covid.columns = ['Pais', 'Confirmados', 'Muertes',\
                 'Recuperados', 'Pobl', 'Ref']

Covid[['Confirmados','Muertes']]

Covid['Confirmados']
Covid.Confirmados

Covid.iloc[5:-5]

Covid[5:-5]

Covid[Covid['Recuperados'] <30]

Covid.iloc[5:-5,2:4]

Covid = Covid.set_index('Pais')

Covid.iloc[5:-5,1:3]

Covid.loc[:'Colombia','Muertes']

Covid.sort_values(by=['Muertes'],
                 ascending=False).loc[:'Colombia',\
                 'Recuperados']

Covid.sort_values(by=['Muertes']).loc['Colombia':,'Recuperados']

Covid.sort_index()

Covid.sort_index().sort_index(axis=1)

NumeroRecuperadosCol = Covid.loc['Colombia','Recuperados']
Covid.loc[Covid['Recuperados'] >= NumeroRecuperadosCol,:]

##################################################
### Operaciones en conjuntos de datos
##################################################

Covid500 = Covid.loc[Covid.Confirmados>500,['Confirmados',\
                     'Muertes']]
Covid500['TasaFat'] = round(100*Covid500['Muertes']/\
                            Covid500['Confirmados'],2)


TFtotal = Covid500.loc['Total','TasaFat']
Covid500['Tasa Fatalidad'] = Covid500['TasaFat'].apply(lambda x:\
                            'Mayor' if x > TFtotal  else 'Menor')
f, ax = plt.subplots(figsize=(10, 10))
ax.set_xlim(100,800000)
ax.set_ylim(10,50000)
ax.set(xscale="log", yscale="log")
ax = sns.scatterplot(x='Confirmados', y='Muertes',\
                     hue='Tasa Fatalidad', s=200,\
                     style = 'Tasa Fatalidad',\
                     data=Covid500.drop('Total'))
ax.legend(loc='upper left',frameon=False, markerscale=2)

for i in Covid500.index[:-1]:
    ax.annotate(i,(Covid500.loc[i,'Confirmados'],\
    Covid500.loc[i,'Muertes']))
ax.set_xlabel('Casos confirmados')
ax.set_ylabel('Muertes')
ax.plot([100, 800000], [TFtotal, 8000*TFtotal], 'k:')


exonH = pd.read_csv(paginaD+'exon_table.txt')
exonH['longitud'] = exonH['exon_chrom_end']-\
                    exonH['exon_chrom_start']+1
exonHTotal = exonH.groupby('transcript_name')['longitud'].sum()


np.log10(exonH['longitud'].describe())
particion = 10 ** np.arange(0.3,5,0.1)
f, (ax1, ax2) = plt.subplots(2, 1)
ax1.hist(data=exonH,x='longitud',bins = particion,range=(0.3,5))
ax1.set_xscale('log')
ax2.hist(exonHTotal,bins = particion,range=(0.3,5))
ax2.set_xscale('log')
ax2.set_xlabel('Longitud')

Audaz['IBold'] = 1/Audaz['coraje']
AudazM = Audaz.groupby('id')[['IBold','conteo',\
                       'exploracion']].mean()
AudazM['Audacia'] = 300 - AudazM['IBold']
f = sns.jointplot(x="conteo", y="Audacia", kind="reg",\
                   data=AudazM,xlim=(0, 8), ylim=(-5, 300),\
                   marginal_kws=dict(bins=15,kde=False),\
                   joint_kws=dict(ci=None), color='k')
f.ax_joint.set_xlabel(r'Número de espermatozoides ($10^6$)')


AudazM['AudCat'] = pd.cut(AudazM['Audacia'], [-1,10,50,200,300],
                          labels=["Nula","Baja","Media","Alta"])
AudazM['EspCat'] = pd.cut(AudazM['conteo'],[0,3,8],
                          labels=["Bajo","Alto"])

AudazM.groupby(['AudCat', 'EspCat'])['exploracion'].mean()

AudazM.groupby(['AudCat','EspCat'])['exploracion'].mean().\
               unstack()

AudazM.pivot_table('exploracion',index='AudCat',
                   columns='EspCat')

AudazMe = pd.melt(AudazM, id_vars= ["EspCat","AudCat"],
                  value_vars=["exploracion"])

AudazMe.sort_values(['AudCat','EspCat','value'])


# Definición de colores amigables para personas daltónicas y
# que al imprimir a blanco y negro mantiene la escala
colores = sns.color_palette("cubehelix", 16)
f, ax = plt.subplots()
sns.despine(left=True)
sns.stripplot(x="value", y="AudCat", hue="EspCat",
              data=AudazMe, dodge=True, alpha=.8,
              palette= [colores[0], colores[7]])
sns.pointplot(x="value", y="AudCat", hue="EspCat",
              data=AudazMe, dodge=0.5, join=True,
              palette=[colores[10], colores[13]],
              markers="d", ci = 'sd',
              linestyles=['dotted','dashed'])
ax.set(xlabel='Exploración (s)', ylabel='Audacia')
objLeyenda, etiquetas = ax.get_legend_handles_labels()
ax.legend(objLeyenda[0:2], etiquetas[0:2], title="Nivel Esperma",
          loc="center right")

##################################################
## Indexación jerárquica
##################################################

exonH = pd.read_csv(paginaD+'exon_table.txt', index_col=[0,1,2])

exonH = exonH.set_index(['transcript_name', 'exon_id',\
                        'exon_rank'])

exonH.loc[('TSPAN6-001')]

exonH.loc[('TSPAN6-001','ENSE00001855382')]
exonH.loc[('TSPAN6-001','ENSE00001855382',1)]

exonH = exonH.set_index(['transcript_name', 'exon_id',\
                         'exon_rank']).sort_index()

exonH.loc[("A1BG-001"):("A1CF-002")]

exonH.loc[("A1BG-001","ENSE00003509215"):\
          ("A1CF-002","ENSE00001142847")]

exonH.loc[[("A1BG-001","ENSE00003509215",5),\
           ("A1CF-002","ENSE00001142847",10)]]
exonH.loc[(["A1BG-001","A1CF-002"],\
           ["ENSE00003509215","ENSE00001142847"],\
           [5,10])]

pd.MultiIndex.from_product([["A1BG-001","A1CF-002"],\
                           ["ENSE00003509215","ENSE00001142847"],\
                           [5,10]])


ConFict = pd.DataFrame({'V1':[1,2,3,4,5,6,7,8,9,10,11,12],
                       'V2':[101,102,103,104,105,106,107,
                             108,109,110,11,12]},
                       index=pd.MultiIndex.from_product([
                           ['a','b'],
                           ['x','y','z' ],
                           ['A','B']]
                       ))

ConFict.loc[[('a','x','A'),('b','z','B')]]
ConFict.loc[(['a','b'],['x'],['A','B'])]


##################################################
### Ensamblaje de datos
##################################################


transH = pd.read_csv(paginaD+"transcript_table.txt",\
                   index_col=[0]).sort_index()

exonH.shape[0]
transH.shape[0]

###########################
### Concatenación
###########################

ws1 = [pd.read_table('http://lib.stat.cmu.edu/datasets/wseries',\
                     skiprows=34, nrows=23-2*(k==3),
                     sep='\t\s\s|\s\s',\
                     header=None, usecols=range(2*k,2*k+2),\
                     names = ['Año','serie'])\
                     for k in range(4)]

ws = pd.concat(ws1, ignore_index=True)

ws3 = pd.concat(ws1, keys=['a','b','c','d'])

pobOCDE = pd.read_csv(paginaD+'PobTotal.csv',\
                      usecols = [0,5,6], index_col=[0])
codigos = pd.read_csv(paginaD+'codigos.csv', usecols=[0,2],\
                      index_col=[1])
# Renombrar columnas
codigos.columns=['Pais']
pobOCDE.columns=['Year', 'Poblacion']
# Renombrar índices
codigos.index.names=['A3']
pobOCDE.index.names=['A3']
# Seleccionar población para el año 2018
pobOCDE = pobOCDE[pobOCDE['Year']==2018]
# Crear conjunto de datos con población y nombre completo del
# país
pobOCDEc = pd.concat([codigos,pobOCDE], join='inner', axis=1)
# Cambiar índice de tres letras por nombre completo
pobOCDEc = pobOCDEc.reset_index().set_index('Pais')
# Concatenación información de SARS-CoV2 y población
CovidPob = pd.concat([Covid,pobOCDEc], join='inner', axis=1)
CovidPob['ReportadosPer'] = CovidPob['Confirmados']/\
                            CovidPob['Poblacion']

###########################
### Combinación
###########################

productos = pd.read_csv(paginaD+'productos.csv')
factura = pd.read_csv(paginaD+'factura.csv')
ventas = pd.read_csv(paginaD+'ventas.csv')
# Revisar devolulaciones
factura['Cancelacion'] = factura['NFactura'].apply(lambda x:\
                                      0 if x[0]=='C' else 1)

VentasT = ventas.merge(productos, how='left', on=['IDProducto',
                       'Fecha'])

VentasT['Total'] = VentasT['Cantidad']*VentasT['Precio']
TotalFact = VentasT.groupby(['NFactura'])['Total'].sum()

factura = factura.merge(TotalFact.to_frame(),\
                        left_on='NFactura',\
                        right_index=True)

FM = factura.groupby('Cliente')[['Total','Cancelacion']].sum()

FM = FM[FM['Cancelacion']>0]

R = np.max((factura['Fecha'])) - \
                     factura.groupby('Cliente')['Fecha'].max()

factura['FechaCor'] = factura['Fecha']*factura['Cancelacion']
R = np.max((factura['FechaCor'])) - \
                     factura.groupby('Cliente')['FechaCor'].max()

RFM = (R.to_frame()).merge(FM, how ='right', left_index=True, \
                           right_index=True)
RFM.columns=["Reciente", "Valor Monetario", "Frecuencia"]

# Particionar variables y guardar las categorias como
# valores enteros
RFM['Rc'] = pd.qcut(RFM.iloc[:,0],4, labels=range(1,5)).\
            astype(int)
RFM['Mc'] = pd.qcut(RFM.iloc[:,1],4, labels=range(1,5)).\
            astype(int)
RFM['Fc'] = pd.qcut(RFM.iloc[:,2],2, labels=range(2,5,2)).\
            astype(int)
# Categoriza los individuos en 5 grupos
RFM['Grupo'] = pd.cut(RFM['Rc']+RFM['Mc']+RFM['Fc'],\
                      [3,5.5,7.5,9.5,11.5,13],\
                      labels=range(1,6))

exonHTotal= (exonHTotal.to_frame()).merge(transH, \
                    left_index=True, right_index=True,\
                    how = 'inner')

sum(exonHTotal['longitud']!=exonHTotal['transcript_length'])

expresionH = pd.read_csv(paginaD+'expression_timeseries.txt',\
                         sep="\t", usecols = range(1,7),
                         index_col=[0])

expresionH.head()
expresionH.tail()


expresionH = pd.read_csv(paginaD+'expression_timeseries.txt',\
                         sep="\t", usecols = range(1,7))
expresionH = expresionH.dropna(subset=['0h','0.5h','3h', '6h',\
                                       '12h']).ffill()
expresionH = expresionH.set_index('Gene Symbol').sort_index()


Var_expresionH = expresionH.var(axis=1)
order_Var_expresionH = np.argsort(Var_expresionH)[-100:]

Cor_Top100 = expresionH.iloc[order_Var_expresionH,].T.corr()
