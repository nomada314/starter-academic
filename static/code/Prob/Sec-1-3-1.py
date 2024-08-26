# %% [markdown]
# ### Lectura de datos 

# %%
import pandas as pd

# %%
direccionPagina = 'https://alexrojas.netlify.app/Data/Bio/'

# %%
##direccionPagina = '/Users/ar/Documents/Books/z/hbio/Datos/'

# %%
direccionPagina+'Peckoltia2015.xls'

# %%
Peckoltia = pd.read_excel(direccionPagina+'Peckoltia2015.xls')

# %% [markdown]
# Código p.19

# %%
Peckoltia.columns

# %%
Peckoltia.head()

# %%
Peckoltia.tail()

# %% [markdown]
# Código pág. 20

# %%
Peckoltia_1 = Peckoltia[['Dentary tooth cup L.','Premax. tooth cup L.','Predorsal L. 2','Head L. 2','Thorax L. 2']]

# %% [markdown]
# También se puede utilizar `filter()`

# %%
Peckoltia.filter(items=['Dentary tooth cup L.','Premax. tooth cup L.','Predorsal L. 2','Head L. 2','Thorax L. 2'])

# %% [markdown]
# Código pág. 21

# %%
Peckoltia_1 = Peckoltia_1.rename(columns={"Dentary tooth cup L.":"DCopa",
                                          "Premax. tooth cup L.":"PCopa",
                                          "Thorax L. 2":"Torax",
                                          "Predorsal L. 2":"Predorsal",
                                          "Head L. 2":"Cabeza"})

# %%
Peckoltia_1.columns

# %%
Peckoltia_1.head()

# %%
Peckoltia_1 = Peckoltia_1.rename(columns={"Predorsal": "PDorsal"})

# %%
Peck_Mouth = Peckoltia.loc[:, Peckoltia.columns.str.startswith('Mouth')]

# %% [markdown]
# Código pág 22

# %%
Peckoltia_2 = Peckoltia.loc[:,'Predorsal L. 2':'SL 2']

# %%
Peckoltia_3 = Peckoltia_1.loc[ Peckoltia_1.PDorsal < 42 ]

# %%
Peck_Mouth2 = Peck_Mouth.loc[Peck_Mouth['Mouth L.'] > Peck_Mouth['Mouth L.'].mean()]

# %% [markdown]
# Código pág 23

# %%
Peckoltia_4 = Peckoltia_2.loc[(Peckoltia_2['Head L. 2'] > 46) | (Peckoltia_2['Head L. 2'] < 29) ]

# %%
Herradura = pd.read_fwf(direccionPagina+'Cangrejos.dat',
                        colspecs=[(0,6),(7,11),(12,15),(16,25),(26,32),(33,39),(40,46)])

# %%
Herradura.iloc[10:20,:]

# %%
Herradura.iloc[Herradura['sat'].idxmax(),:]

# %%
Herradura.iloc[Herradura['weight'].idxmin(),:]

# %% [markdown]
# Código pág 24

# %%
Peckoltia_3 = Peckoltia_3.reset_index()
Peckoltia_3 = Peckoltia_3.drop('index',axis=1)

# %%
Peckoltia_3['Diferencia'] = Peckoltia_3['DCopa'] - Peckoltia_3['PCopa']

# %%
Peck_Mouth2 = Peck_Mouth2.reset_index()
Peck_Mouth2 = Peck_Mouth2.drop('index',axis=1)

# %%
Peck_Mouth2['Area'] = Peck_Mouth2['Mouth L.']*Peck_Mouth2['Mouth W.']

# %%
Peckoltia_4 = Peckoltia_4.reset_index()
Peckoltia_4 = Peckoltia_4.drop('index',axis=1)

# %%


# %%
HerraduraOrd = Herradura.sort_values(['sat','weight'],ascending=[False,True])

# %% [markdown]
# Código pág 25

# %%
Pecko_Final = Peckoltia[['Head L.', 'Head-dorsal L.','Head-eye L.', 'Thorax L.','Abdominal L.','Snout L.']]

# %%
Pecko_Final['Grupo'] = (Peckoltia['Thorax L.'] > Peckoltia['Thorax L.'].median())*1 +  (Peckoltia['Abdominal L.'] > Peckoltia['Abdominal L.'].median())*1 - 1

# %%
Pecko_Final = Pecko_Final[ Pecko_Final['Snout L.'] > Pecko_Final['Snout L.'].quantile(.25) ].drop(['Snout L.','Thorax L.','Abdominal L.'], axis=1).rename(columns={"Head L.":"Cabeza", 
                                                                                                                                                                   "Head-dorsal L.":"CabezaDorzo",
                                                                                                                                                                   "Head-eye L.":"CabezaOjo"})


