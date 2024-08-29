# %% [markdown]
# ### Manipulación de datos - Continuación

# %%
# Código pág 26 Base de datos Camacho_ELEV.csv en la página del libro
import pandas as pd
direccionPagina = 'https://alexrojas.netlify.app/Data/Bio/'
Depredador_Grad = pd.read_csv(direccionPagina+'Camacho_ELEV.csv')
Depredador_Grad.head()

# %%
# Tarea 1: Crear una nueva variable ELEV2 a partir de la variable ELEV (rango 0 a 4000 msnm)

# Primero: Dividir la elevación por 500

Depredador_Grad['ELEV']/500

# %%
# Segundo: Usar la función techo
# Función techo: redondear al entero más pequeño que no es menor que el valor que tenemos
# Ejemplo
import numpy as np
np.ceil(0.748), np.ceil(2.228), np.ceil(5.108) , np.ceil(6.694)
# Pruebe con otros valores

# %%
# Volviendo a nuestro ejemplo de la elevación
np.ceil(Depredador_Grad['ELEV']/500)

# %%
# Tercero: Asignar dicho valor a la variable ELEV2 en la base de datos
Depredador_Grad['ELEV2']=np.ceil(Depredador_Grad['ELEV']/500)
Depredador_Grad.head()

# %%
# Distribución de frecuencia de la variable ELEV2
Depredador_Grad['ELEV2'].value_counts()

# %%
# Tarea 2: Seleccionar las variables X, Y y ELEV2 y asignarlas a la nueva base de datos Depredador_Grad2
Depredador_Grad2=Depredador_Grad[['X','Y','ELEV2']]
# Imprima las primeras cinco filas de Depredador_Grad2

# %%
# Tarea 3: Guardar la base de datos Depredador_Grad2 en la carpeta de trabajo como Depredador_Grad2.csv
# Antes de escribir el comando, saber cuál es la carpeta de trabajo
import os
os.getcwd()

# %%
# Ahora guardar la base de datos en formato csv (comma separated values)
Depredador_Grad2.to_csv('Depredador_Grad2.csv')
# Verifique que el archivo Depredador_Grad2.csv, está en su carpeta de trabajo

# %%
# Código pág 26 Base de datos Herradura
# Tarea 1: Leer la base de datos Cangrejos.dat, un archivo fwf: Fixed width format
Herradura = pd.read_fwf(direccionPagina+'Cangrejos.dat',
                        colspecs=[(0,6),(7,11),(12,15),(16,25),(26,32),(33,39),(40,46)])
# Dimensiones de la base de datos: número de filas, número de columnas
# En este caso: 
# 137 filas que corresponden al número de cangrejos observados
# 7 columnas que corresponden al índice (de cada fila) y las seis variables medidas a cada cangrejo

Herradura.shape

# %%
# Primeras cinco filas de la base de datos Herradura
Herradura.head()

# %%
# Cuáles son los nombres de las variables?

# %%
# Tarea 2: Cambio de nombre de las variables
Herradura=Herradura.rename(columns={'crab':'cangrejo',
                                    'sat':'satelites',
                                    'weight':'peso',
                                    'width':'ancho',
                                    'spine':'espina'})

Herradura.head()

# %%
# Tarea 3: Guarde en la carpeta de trabajo la base de datos Herradura con el nombre Herradura.csv
# Verifique que el archivo Herradura.csv, está en su carpeta de trabajo

# %% [markdown]
# #### Datos en formato ancho y largo
# 
# Formato “ancho”: cuando hay una fila (individuo u objeto) con mediciones para diferentes variables en las columnas
# 
# Formato “largo”: cuando hay una fila por cada medición y, por ende, varias filas por sujeto.
# 
# Para ilustrar los dos formatos vamos a usar un subconjunto de la base de datos Herradura, aquellos cangrejos con 10 satélites

# %%
# Selección del subconjunto de cangrejos con 10 satélites, en la base de datos Herradura
Sat10 = Herradura.loc[Herradura['satelites']==10]
Sat10

# Sat10 es un conjunto de datos en formato ancho:
# 3 filas, cada una para uno de los tres cangrejos con 10 satélites
# 7 columnas, el índice y las seis variables que se midieron a cada cangrejo

# %%
# Formato largo, toda la base de datos Sat10

Sat10Largo=pd.melt(Sat10)
Sat10Largo

# %%
# Formato largo, usando cangrejo y satelites como identificadores de cada sujeto, para todas las demas variables
Sat10Largo=pd.melt(Sat10, id_vars=['cangrejo', 'satelites'],
                   var_name='x', value_name='valor')
Sat10Largo

# %%
# Formato largo, usando cangrejo y satelites como identificadores de cada sujeto, para las variables peso y ancho

Sat10Largo=pd.melt(Sat10, id_vars=['cangrejo', 'satelites'],
                   value_vars=['peso','ancho'],
                   var_name='x', value_name='valor')
Sat10Largo


