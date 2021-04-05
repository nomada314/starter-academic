#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Created on Mon Apr 20 09:50:47 2020
@author:
"""

##################################################
### Otras librerías de interés
##################################################


import numpy as np
import matplotlib.pyplot as plt
from skimage import io
from matplotlib.collections import LineCollection
from PIL import Image
import urllib

from Bio import SeqIO
from Bio.Seq import Seq
from Bio.Alphabet import IUPAC
from Bio import Entrez
from Bio.SeqUtils import GC
from Bio.SeqUtils.ProtParam import ProteinAnalysis
from Bio import Phylo

from astropy.coordinates import SkyCoord
from astropy.coordinates import Angle
from astroquery.sdss import SDSS
from astropy.table import Table
from astropy import units as u
from astropy.table import join
from astropy.io import fits
from astropy.modeling import models, fitting
from astropy.modeling.models import custom_model
from astropy.modeling import Fittable1DModel, Parameter
from astroquery.sdss import SDSS


##################################################
### Librería biopython
##################################################
from Bio import SeqIO
from Bio.Seq import Seq


paginaD = 'Datos/'
archivo = 'SARS-CoV2Col.fasta'
SARSCoV2 = list(SeqIO.parse(paginaD+archivo, "fasta"))

SARSCoV2[0].id
SARSCoV2[0].seq

from Bio.Alphabet import IUPAC
SARSCoV2 = list(SeqIO.parse(paginaD+archivo, "fasta",\
                            IUPAC.ambiguous_dna))

archivo = 'SARS-CoV2Ant.gb'
SARSCoV2Ant = list(SeqIO.parse(paginaD+archivo, "genbank"))[0]

SARSCoV2Ant.id
SARSCoV2Ant.description
print(SARSCoV2Ant.features[2])

SARSCoV2Ant_ARN = (SARSCoV2[1].seq[211:13429]).transcribe()
SARSCoV2Ant_Prot = (SARSCoV2[1].seq[211:13429]).translate()

SARSCoV2Ant_QIS30052_2 = SARSCoV2Ant.features[2].\
                       extract(SARSCoV2Ant.seq)

SARSCoV2Ant_ARN.transcribe()  # Produce un error
SARSCoV2Ant_ARN.translate()
SARSCoV2Ant_ARN.back_transcribe()

SARSCoV2Ant_QIS30052_2.complement()
SARSCoV2Ant_QIS30052_2.reverse_complement()

##################################################
### Acceso al repositorio `Entrez`
##################################################

from Bio import Entrez
Entrez.email = "usuario@ejemplo.com"
busqueda = Entrez.esearch(db="nucleotide",\
                      term="sickle cell AND human NOT chromosome",
                      retmax =100)
resultados = Entrez.read(busqueda)


busqueda = Entrez.efetch(db="nucleotide", id=resultados['IdList'],
                       retmax="100", rettype="fasta",
                       retmode="xml")
resultados = Entrez.read(busqueda)

resultados[0]['TSeq_sequence']

busqueda = Entrez.efetch(db="nucleotide", id="179408", \
                       rettype="fasta", retmode="xml")
HBB_gen = Entrez.read(busqueda)[0]

["AB026282", "AF076044","AF076051", "AF076052","AB026277",
"AB026278", "AB066603", "AF076089", "AF076090","AB026269",
"AB026271", "AB026270"]

busqueda = Entrez.efetch(db="nucleotide", id=["AB026282",\
            "AF076044", "AF076051", "AF076052","AB026277",\
            "AB026278", "AB066603", "AF076089", "AF076090",\
            "AB026269", "AB026271", "AB026270"],\
                       rettype="fasta", retmode="xml")
CitocromoB = Entrez.read(busqueda)

CitocromoB_sec = [Seq(x['TSeq_sequence'],IUPAC.ambiguous_dna)\
                  for x in CitocromoB]

CitocromoB_sec = []
for x in CitocromoB:
    CitocromoB_sec.append(Seq(x['TSeq_sequence'],\
                          IUPAC.ambiguous_dna))

from Bio.SeqUtils import GC
CitocromoB_GC = [GC(x) for x in CitocromoB_sec]

from Bio.SeqUtils.ProtParam import ProteinAnalysis
CitocromoB_trad = [str(x.translate(to_stop=True)) \
                                     for x in CitocromoB_sec]
CitocromoB_analizada = [ProteinAnalysis(x) for x in\
                                             CitocromoB_trad]
CitocromoB_pesoM = [x.molecular_weight() for x in \
                                        CitocromoB_analizada]


pinguinos = pd.read_csv(paginaD+'pinguinos.csv', index_col=[0])
pinguinos.columns=["Masa"]
pinguinos['GC'] = CitocromoB_GC
pinguinos['pm'] = CitocromoB_pesoM
# Crea la variable género
pinguinos['Genero'] = [x.split()[0] for x in pinguinos.index]


ax = sns.scatterplot('GC','pm',hue="Genero",data=pinguinos,\
                style = "Genero", s=250,\
                palette = sns.color_palette("cubehelix", 5))
ax.set(xlabel = "Contenido GC", ylabel = "Peso molecular")

##################################################
### Visualización de secuencias
##################################################

def traduccion(sec):
    cod = {"T":"00","C":"01","A":"10","G":"11", "N":""}
    y = (np.array([int(x)-.5 for x in \
         sec.translate(str.maketrans(cod))])).cumsum()
    return y

SARS = list(SeqIO.parse(paginaD+'SARS.fasta', "fasta",\
                        IUPAC.ambiguous_dna))
Mur = list(SeqIO.parse(paginaD+'Murcielago.fasta', "fasta",\
                        IUPAC.ambiguous_dna))
SARStodas = SARS+SARSCoV2+Mur

St = [traduccion(str(x.seq)) for x in SARStodas]
long = [len(x) for x in St]
XYvis = pd.DataFrame({"x":[x for subl in [np.arange(.5,l/2+.5,.5)\
                      for l in long] for x in subl],\
              "y": [x for subl in St for x in subl],\
              "Secuencia": np.repeat(np.arange(1,6), long)} )
ax = sns.lineplot('x','y', data=XYvis, hue='Secuencia',
                   markers=True, estimator=None,
                   palette = sns.color_palette("cubehelix", 5))
ax.set(xlabel='Posición (PB)',ylabel='')
plt.legend(loc='upper right')


with open("SARSCoV.fasta", "w") as salida:
    SeqIO.write(SARStodas, salida, "fasta")

from Bio import Phylo
archivo = 'arbol.dnd'
arbolSARSCoV = Phylo.read(paginaD + archivo, 'newick')
fig, ax = plt.subplots(1,1,figsize=(6,6))
ax.set(xlabel='Longitud rama')
plt.axis('off')
Phylo.draw(arbolSARSCoV, axes=ax)


##################################################
### Librería astropy
##################################################

##################################################
### Archivos con formato `FITS`
##################################################

from astropy.io import fits
pag0 = 'https://fermi.gsfc.nasa.gov/ssc/data/p6v11/analysis/'
pag1 = 'software/aux/gll_iem_v02_P6_V11_DIFFUSE.fit'
ListaHDU = fits.open(pag0+pag1)
ListaHDU.info()

Unidad0 = ListaHDU[0]
Unidad0.header

Unidad0.header['INSTRUME']

Unidad0.header['CTYPE1']
Unidad0.header['CTYPE2']
Unidad0.header['CTYPE3']

import matplotlib.pyplot as plt
f = plt.figure()
ax = f.add_subplot(1, 1, 1)
ax.imshow(np.log(Unidad0.data[0,:,:]),\
          extent=[-180., 180., -90., 90.], cmap='gray',
          origin='lower')
ax.set_xlim(180., -180.)
ax.set_ylim(-90., 90.)
ax.set_xlabel('Longitud galáctica')
ax.set_ylabel('Latitud  galáctica')
ListaHDU.close()


pag0  = 'https://fermi.gsfc.nasa.gov/ssc/data/access/lat/'
pag1  = '8yr_catalog/gll_psc_v21.fit'
datos_fuentes = fits.getdata(pag0+pag1,1)

info = fits.getheader(pag0+pag1,1)

from astropy.table import Table
fuentes = Table(datos_fuentes)

lon = fuentes['GLON']
lat = fuentes['GLAT']

lon[lon > 180] -= 360
f = plt.figure()
ax = f.add_subplot(1, 1, 1)
ax.imshow(np.log(Unidad0.data[0,:,:]),\
          extent=[-180., 180., -90., 90.],\
          cmap='gray', origin='lower')
ax.scatter(lon, lat, s=10, edgecolor='none', facecolor='white',\
           alpha=0.5)
ax.set_xlim(180., -180.)
ax.set_ylim(-90., 90.)
ax.set_xlabel('Longitud galáctica')
ax.set_ylabel('Latitud  galáctica')

from astropy import units as u
from astropy.coordinates import SkyCoord
centroHCG92 = SkyCoord(338.98954167*u.deg, 33.96*u.deg)

import urllib
escala = 10*u.arcmin
corte ='http://skyservice.pha.jhu.edu/DR14/ImgCutout/getjpeg.aspx'
busqueda = urllib.parse.urlencode(dict(ra=centroHCG92.ra.deg,
                          dec=centroHCG92.dec.deg,
                          width=1024, height=1024,
                          scale=escala.to(u.arcsec).value/1024))
pag = corte + '?' + busqueda
urllib.request.urlretrieve(pag, 'HCG_92.jpg')


from PIL import Image
HCG92 = Image.open('HCG_92.jpg')

ro, ve, az = HCG92.split()
tam_x, tam_y = HCG92.size
ro_pix = (np.array(ro.getdata())).reshape(tam_y, tam_x)
ve_pix = (np.array(ve.getdata())).reshape(tam_y, tam_x)
az_pix = (np.array(az.getdata())).reshape(tam_y, tam_x)


# Encabezados:
encab = fits.Header()
r_enc = fits.Header()
v_enc = fits.Header()
a_enc = fits.Header()

# Encabezado primario
encab['Proyecto'] = 'Grupo de galaxias HGC92'
encab['GLon'] ='338.98954167'
encab['GLat'] ='33.96'

# Encabezado banda roja
r_enc['Titulo'] = 'Banda r HCG92'
r_enc['Observ'] = 'Estudiante R'
r_enc['Fecha'] = '12-11-20'
r_enc['Hora'] = '23:56'
r_enc['Laborat'] = 'Lab1'
r_enc['Grupo'] = 'GABH1'

# Encabezado banda verde
v_enc['Titulo'] = 'Banda g HCG92'
v_enc['Observ'] = 'Estudiante V'
v_enc['Fecha'] = '18-11-20'
v_enc['Hora'] = '00:50'
v_enc['Grupo'] = 'GABH2'

# Encabezado banda azul
a_enc['Titulo'] = 'Banda b HCG92'
a_enc['Observ'] = 'Estudiante A'
a_enc['Fecha'] = '25-12-20'
a_enc['Hora'] = '02:50'
a_enc['Grupo'] = 'GABH3'


Lista_HDUS = fits.HDUList()
Lista_HDUS.append(fits.PrimaryHDU(header=encab))
Lista_HDUS.append(fits.ImageHDU(ro_pix, header=r_enc,\
                  name="Banda Roja"))
Lista_HDUS.append(fits.ImageHDU(ve_pix, header=r_enc,\
                  name="Banda Verde"))
Lista_HDUS.append(fits.ImageHDU(az_pix, header=r_enc,\
                  name="Banda Azul"))

Lista_HDUS.writeto('HGC92bandas.fits')
Lista_HDUS.close()

from skimage import io
HCG92g = io.imread('HCG_92.jpg',as_gray=True)
f, ax  = plt.subplots(2, 2)
ax[0,0].imshow(HCG92g, cmap='gray')
ax[0,1].imshow(ro_pix, cmap='gray_r')
ax[1,0].imshow(ve_pix, cmap='gray_r')
ax[1,1].imshow(az_pix, cmap='gray_r')
ax[0,0].axis('off')
ax[0,1].axis('off')
ax[1,0].axis('off')
ax[1,1].axis('off')

##################################################
### Unidades y coordenadas
##################################################

from astropy.constants import G
from astropy import units as u
F = (G*(1*u.M_sun)*1407*u.imperial.pound)/\
    (141600000*u.imperial.mile)**2

F.to(u.N)

def FuerzaGravV0(peso,dist):
    from astropy.constants import G
    return (G*u.M_sun*peso)/dist**2

@u.quantity_input(peso = u.kg, dist = u.AU)
def FuerzaGrav(peso,dist):
    from astropy.constants import G
    return ((G*u.M_sun*peso)/dist**2).to(u.N)

FuerzaGrav(1407*u.imperial.pound,141600000*u.imperial.mile)


@u.quantity_input(T = u.K)
def LeyPlanck(T, nu = 299792.458):
    from astropy.constants import c, k_B, h
    x = u.Quantity(nu, u.Hz, dtype=np.float64)
    bt = (2*h*x**3)/((c**2)*np.expm1(h*x/(k_B*T)))/u.sr
    unidades = u.erg / (u.cm ** 2 * u.s * u.Hz * u.sr)
    return bt.to(unidades)

from astropy.modeling import models
CN = models.BlackBody(temperature=7000*u.K)
CN(750000)


from astropy.coordinates import Angle
ra = Angle(np.array(Zwicky['ra'])*u.degree)
ra = ra.wrap_at(180*u.degree)
dec = Angle(np.array(Zwicky['dec'])*u.degree)

fig = plt.figure()
ax = fig.add_subplot(111, projection="aitoff")
ax.scatter(ra.radian, dec.radian, s=4, alpha=.7, marker='.',\
           zorder=-1, color='k')
ax.grid(True)


pag0 = 'https://heasarc.gsfc.nasa.gov/docs/rosat/survey/sxrb/'
ROSAT = fits.open(pag0+'rass_m.fits')

enc_ROSAT = fits.getheader(pag0+'rass_m.fits')
enc_ROSAT['HISTORY'][37:43]

imag_ROSAT = ROSAT[0].data
fig = plt.figure()
ax = fig.add_subplot(111)
ax.imshow(imag_ROSAT, cmap='gray', origin='lower', vmin=0,\
          vmax=500.)
ax.set_xticklabels('')
ax.set_yticklabels('')

HCG92_coord = coord.SkyCoord.from_name('HCG 92')

HCG92_coord.transform_to('galactic')

HCG92_coord.ra
HCG92_coord.ra.to(u.hourangle)
HCG92_coord.ra.to(u.radian)
HCG92_coord.ra.hour, HCG92_coord.ra.deg, HCG92_coord.ra.rad
HCG92_coord.to_string('hmsdms', sep=':', precision=1)

##################################################
### Tablas de datos
##################################################

t0 = Table()
t0['nombres'] = ['G1', 'G2', 'G3', 'G4']
t0['Lum'] = [2.2, 2.4, 0.6, 0.8]

t0.columns
t0.dtype
t0['Lum']
t0['Lum'][3]
t0[0:2]
t0[t0['Lum']>2]

t0[0]
t0[1]['Lum']

t0.add_row(('G5', 3.08))
t0['InvLum'] = 1/t0['Lum']
t0['Eliminar'] = t0['InvLum']  + t0['Lum']
t0['Eliminar2'] = np.log(t0['Eliminar'])
t0['Eliminar3'] = t0['Eliminar']/2

t0.insert_row(3,('G6', 2, .05, 2.05,np.log(2), 1.025))

t0.remove_column('Eliminar')
t0.remove_columns(['Eliminar2','Eliminar3'])

t0['InvLum'].format = '%.2f'
t0['Lum'].format = '%.2f'

t0['veloc'] = [2,3,4.5,3.4,6,1.0]* u.m/u.s
t0['dist'] = [2.3,4.5,5,1.3,1.2,2.4]* u.m

t0['Lum'].unit = 'W'


SS_unid = Table.from_pandas(SS)
col_unidades = SS.columns.drop(['Objeto',\
              'Orbital Eccentricity','Ring System?',\
               'Global Magnetic Field?', 'Number of Moons'])
unidades = ['kg', 'km', 'kg/m**3', 'm/s**2', 'km/s', 'hour',
            'hour', 'km', 'km', 'km', 'day', 'km/s', 'degree',
            'degree', 'deg_C', 'Ba']
for i,j in enumerate(col_unidades):
    SS_unid[j].unit = unidades[i]

from astroquery.sdss import SDSS
coorden = SkyCoord(18.23171046,0.98136156, unit=u.degree)
bus_var = ['ra', 'dec', 'psfMag_g', 'psfMagErr_g', 'psfMag_r',
            'psfMagErr_r','psfMag_i', 'psfMagErr_i','psfMag_z',
            'psfMagErr_z']
busqueda = SDSS.query_crossid(coorden, photoobj_fields=bus_var)


Objetos = Table.read(paginaD+'FGal.tbl', format='ascii.ipac')
coorden = SkyCoord(Objetos['ra'], Objetos['dec'], unit=u.degree)
busqueda= SDSS.query_crossid(coorden,obj_names=Objetos['nombre'])

from astropy.table import join
busqueda.rename_column('obj_id', 'nombre')
resultado= join(Objetos,busqueda, keys='nombre',join_type='left')

resultado['gz'] = resultado['psfMag_g']-resultado['psfMag_z']
resultado[['nombre', 'gz','J']]


UGC10214_coord = SkyCoord.from_name('UGC 10214')
UGC10214_2mass = Table.read('UGC10214.tbl', format='ascii.ipac')

from astroquery.sdss import SDSS
UGC10214_sdss = SDSS.query_region(coordinates=UGC10214_coord,\
                         radius=20*u.arcmin,\
                         photoobj_fields=['ra','dec','u','g',\
                                          'r','i','z'])

UGC10214_sdss = SDSS.query_region(coordinates=UGC10214_coord,\
                         radius=40*u.arcmin,\
                         photoobj_fields=['ra','dec','u','g',\
                                          'r','i','z'])

separacion =  UGC10214_coord.separation(C_sdss)
mascara = C_sdss[separacion.to_value() < (1/3)]
fig, ax = plt.subplots(1,1,figsize = (10, 10))
ax.scatter(mascara.ra, mascara.dec, color='gray',\
           marker='.', label='SDSS',alpha=.7)
ax.scatter(C_2mass.ra, C_2mass.dec, color='k', marker="*",
           label='2MASS')
ax.set_xlabel(r'Ascención recta, $\alpha$ (grados)')
ax.set_ylabel(r'Declinación, $\delta$ (grados)')
ax.legend(loc='lower right')


C_sdss = SkyCoord(UGC10214_sdss['ra']*u.deg,\
                  UGC10214_sdss['dec']*u.deg)
C_2mass = SkyCoord(UGC10214_2mass['ra'],\
                 UGC10214_2mass['dec'])
empates = C_2mass.match_to_catalog_sky(C_sdss)


id = empates[0][empates[1].arcsec <= 1.0]
r_Mag = UGC10214_sdss['r'][id]
rH_color = r_Mag-(UGC10214_2mass['h_m'])[empates[1].arcsec<= 1.0]
gr_color = UGC10214_sdss['g'][id] - r_Mag
positivos = (r_Mag > 0)&(rH_color>0)&(gr_color>0)
plt.scatter(rH_color[positivos], gr_color[positivos], color='k')
plt.xlabel('r-H')
plt.ylabel('g-r')


i = 1
espectros = []
fibras = []
while i < 641:
    try:
        espectros.append(SDSS.get_spectra(plate=266,\
                    fiberID=i, mjd=51630)[0])
        fibras.append(i)
        i +=1
    except:
        i +=1


flujo = [ (x[1].data['flux']) for x in espectros]

lam = [10**(x[1].data['loglam']) for x in espectros]

import statsmodels.api as sm
lowess = sm.nonparametric.lowess
m = 6563
modelo = models.Gaussian1D(40, m, 100)
modelo.mean.max = m + 200
modelo.mean.min = m - 200
metodo = fitting.LevMarLSQFitter()


mG = [lowess(f,l,frac=1/5) for f,l in zip(flujo,lam)]
ajuste = [metodo(modelo,z[:,0],f-z[:,1])\
                           for f,z in zip(flujo, mG)]



import pandas as pd
import seaborn as sns
param_ModGauss = pd.DataFrame([x.parameters for x in ajuste])
param_ModGauss.columns = ['A', 'mu', 'sd']
param_ModGauss['Pico'] = (np.abs(param_ModGauss['A'])< 100)&\
                     (np.abs(param_ModGauss['A'])> 5)&\
                     (param_ModGauss['sd']> 1)&\
                     (param_ModGauss['sd']< 100)
f, ax = plt.subplots(figsize=(7, 7))
ax.set_xlim(-55,55)
ax.set_ylim(0.1,50)
ax.set(xlabel="Amplitud", ylabel="Desviación estándar")
for i in range(param_ModGauss.shape[0]):
    if param_ModGauss['Pico'][i]:
        ax.annotate(xy=(param_ModGauss['A'][i]-2,\
                        param_ModGauss['sd'][i]+1),\
                        s=str(fibras[i]), fontsize=14)
sns.scatterplot('A', 'sd', style='Pico',data=param_ModGauss,\
                ax = ax, color='k', legend=False)
