+++
date      = 2020-09-28
lastmod   = 2022-04-03
draft     = true
math      = true
+++

Métodos de muestreo
================

**Material taken from Lind, D. A., Marchal, W. G., & Wathen, S. A.
(2017). Statistical techniques in business & economics. McGraw-Hill
Education.**

## Sampling methods

The purpose of inferential statistics is to find something about a
population based on a sample. A sample is a portion or part of the
population of interest. In many cases, sampling is more feasible than
studying the entire population.

### Reason to sample

-   To contact the whole population would be time-consuming
-   The cost of studying all the items in a population may be
    prohibitive
-   The physical impossibility of checking all items in the population
-   The destructive nature of some tests
-   The sample results are adequate

### Simple Random Sampling

**SIMPLE RANDOM SAMPLE.** A sample selected so that each item or person
in the population has the same chance of being included.

> “The S&P 500 stock market index, maintained by S&P Dow Jones Indices,
> comprises 505 common stocks issued by 500 large-cap companies and
> traded on American stock exchanges (including the 30 companies that
> compose the Dow Jones Industrial Average), and includes about 80
> percent of the American equity market by capitalization. The index is
> weighted by free-float market capitalization, so more valuable
> companies account for relatively more of the index”
> [Wikipidea](https://en.wikipedia.org/wiki/List_of_S%26P_500_companies)

``` r
# Lectura del archivo con la lista de las 505 compañias
SP500 = read.csv("https://alexrojas.netlify.app/Data/Lectures/SP500.csv")
# Podemos usar la función `sample()`para generar una muestra aleatoria
muestra1 = sample(SP500$Security, 15)
# Otra muestra
muestra2 = sample(SP500$Security, 15)
```

Table 1. Two random selected samples from the 505 companies included in the S&P 500 index

| Sample 1                      | Sample 2                      |
|:------------------------------|:------------------------------|
| AbbVie                        | American Express              |
| Amgen                         | American Water Works          |
| Etsy                          | Charter Communications        |
| Halliburton                   | Domino’s Pizza                |
| HCA Healthcare                | Entergy                       |
| Hilton Worldwide              | Everest Re                    |
| Ingersoll Rand                | Fortive                       |
| Kimberly-Clark                | Generac Holdings              |
| Kinder Morgan                 | Molson Coors Beverage Company |
| Newell Brands                 | Nvidia                        |
| Nucor                         | People’s United Financial     |
| PTC                           | Salesforce                    |
| Regions Financial Corporation | Stanley Black & Decker        |
| SBA Communications            | Trimble                       |
| Target Corporation            | United Airlines               |


### Systematic Random Sampling

**SYSTEMATIC RANDOM SAMPLE.** A random starting point is selected, and
then every kth member of the population is selected.

> Stood’s Grocery Market needs to sample their customers to study the
> length of time customers spend in the store. We decide to select 100
> customers over 4 days, Monday through Thursday. We will select 25
> customers a day and begin the sampling at different times each day: 8
> a.m., 11 a.m., 4 p.m., and 7 p.m. We write the 4 times and 4 days on
> slips of paper and put them in two hats—one hat for the days and the
> other hat for the times. We select one slip from each hat. This
> ensures that the time of day is ran- domly assigned for each day.

``` r
dias = c("Lunes", "Martes","Miércoles","Jueves")
horas = c(8,11,4,7)
h = sample(horas)
d = sample(dias)
cliente = sample(1:10,1)
```

Table 2. Día y hora para iniciar el muestreo de clientes

|     | Jueves | Miércoles | Martes | Lunes |
|:----|-------:|----------:|-------:|------:|
| h   |      7 |         4 |      8 |    11 |


``` r
cat("Seleccionar los clientes:\n", cliente + seq(0,240,10))
```

    ## Seleccionar los clientes:
    ##  4 14 24 34 44 54 64 74 84 94 104 114 124 134 144 154 164 174 184 194 204 214 224 234 244

<div class="alert alert-warning">

<p>
Before using systematic random sampling, we should carefully observe the
physical order of the population. When the physical order is related
to the population characteristic, then systematic random sampling
should not be used because the sample could be biased. For example, if
we wanted to audit the invoices in a file drawer that were ordered in
increasing dollar amounts, systematic random sampling would not
guarantee an unbiased random sample.
</p>

</div>

### Stratified Random Sampling

> **STRATIFIED RANDOM SAMPLE.** A population is divided into subgroups,
> called strata, and a sample is randomly selected from each stratum.

Usually the strata are formed based on members’ shared attributes or
characteristics. A random sample from each stratum is taken in a number
proportional to the stratum’s size when compared to the population. Once
the strata are defined, we apply simple random sampling within each
group or stratum to collect the sample.

> Going back to the S&P 500 companies, we would like to determine
> whether firms in different Global Industry Classification Standard
> (GICS) sectors spend different amounts on advertising. Based on the
> following table, if simple random sampling is used, observe that
> companies in the Industry and Information technology sectors have a
> higher chance of being selected than companies in the Energy sector.

``` r
GICSweights = table(SP500$GICS.Sector)/505
```

Table 3. Relative frequency per sector

| GICS Sector            |      Freq |
|:-----------------------|----------:|
| Communication Services | 0.0534653 |
| Consumer Discretionary | 0.1247525 |
| Consumer Staples       | 0.0633663 |
| Energy                 | 0.0415842 |
| Financials             | 0.1287129 |
| Health Care            | 0.1267327 |
| Industrials            | 0.1465347 |
| Information Technology | 0.1465347 |
| Materials              | 0.0554455 |
| Real Estate            | 0.0574257 |
| Utilities              | 0.0554455 |


We would like to sample forty companies; therefore, we could sample the
following number of companies from each strata:

``` r
ni = round(GICSweights*40)
```

Table 4. Number of companies to select from each GICS sector

| Sector                 | Number |
|:-----------------------|-------:|
| Communication Services |      2 |
| Consumer Discretionary |      5 |
| Consumer Staples       |      3 |
| Energy                 |      2 |
| Financials             |      5 |
| Health Care            |      5 |
| Industrials            |      6 |
| Information Technology |      6 |
| Materials              |      2 |
| Real Estate            |      2 |
| Utilities              |      2 |



The following code defined an empty vector and a variable `namesGICS`
with the names of the GICS sectors. The `for` cycle loops thru the GICS
sectors selecting the indicated number of companies.

``` r
StratSample = c()
namesGICS = names(GICSweights)
for(i in 1:11)
  StratSample = c(StratSample, sample(SP500[SP500$GICS.Sector==namesGICS[i],"Security"],ni[i]))
```

Table 5. Selected sample using stratified sampling

| Company                         |
|:--------------------------------|
| The Walt Disney Company         |
| News Corp (Class A)             |
| Darden Restaurants              |
| PVH                             |
| eBay                            |
| Gap                             |
| Tractor Supply Company          |
| Kraft Heinz                     |
| Monster Beverage                |
| Hormel                          |
| Coterra                         |
| Phillips 66                     |
| Cincinnati Financial            |
| Invesco                         |
| Lincoln National                |
| MetLife                         |
| Marsh & McLennan                |
| Teleflex                        |
| Thermo Fisher Scientific        |
| Abiomed                         |
| Charles River Laboratories      |
| Edwards Lifesciences            |
| Paccar                          |
| Stanley Black & Decker          |
| General Dynamics                |
| IDEX Corporation                |
| Rollins                         |
| United Parcel Service           |
| Cisco Systems                   |
| Texas Instruments               |
| Fleetcor                        |
| Tyler Technologies              |
| NortonLifeLock                  |
| PTC                             |
| CF Industries                   |
| Ball Corp                       |
| Welltower                       |
| Boston Properties               |
| WEC Energy Group                |
| Public Service Enterprise Group |


Stratified sampling has the advantage, in some cases, of more accurately
reflecting the characteristics of the population than does simple random
or systematic random sampling.

### Cluster Sampling

Cluster Sampling is often employed to reduce the cost of sampling a
population scattered over a large geographic area.

> CLUSTER SAMPLING A population is divided into clusters using naturally
> occurring geographic or other boundaries. Then, clusters are randomly
> selected and a sample is collected by randomly selecting from each
> cluster.
