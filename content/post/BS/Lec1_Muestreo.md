Métodos de muestreo
================

**Material taken from Lind, D. A., Marchal, W. G., & Wathen, S. A.
(2017). Statistical techniques in business & economics. McGraw-Hill
Education.**

## Problem:

> THE NIKE annual report says that the average American buys 6.5 pairs
> of sports shoes per year. Suppose a sample of 81 customers is surveyed
> and the population standard deviation of sports shoes purchased per
> year is 2.1 What is the standard error of the mean in this experiment?

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

Two random selected samples from the 505 companies included in the S&P
500 index

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

``` r
kable(rbind(h), col.names = d, caption = "Día y hora para iniciar el muestreo de clientes")
```

|     | Jueves | Miércoles | Martes | Lunes |
|:----|-------:|----------:|-------:|------:|
| h   |      7 |         4 |      8 |    11 |

Día y hora para iniciar el muestreo de clientes

``` r
cat("Seleccionar los clientes:\n", cliente + seq(0,240,10))
```

    ## Seleccionar los clientes:
    ##  4 14 24 34 44 54 64 74 84 94 104 114 124 134 144 154 164 174 184 194 204 214 224 234 244

<div class="alert alert-warning">

<p>
Before using systematic random sampling, we should carefully observe the
physi- cal order of the population. When the physical order is related
to the population charac- teristic, then systematic random sampling
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
