
<!-- README.md is generated from README.Rmd. Please edit that file -->

# widepollution

<!-- badges: start -->
<!-- badges: end -->

This package provides a set of functions aimed at aiding the processing
of wide-format .csv and json files. This package works also as a wrap
package for a processing and analysis workflow available in the vignette
`Spatio-temporal monitoring of Madrid pollution in 2023`. In this
vignette the tailored functions are applied to authoritative pollution
datasets found in Madrid Open Data portal.

## Installation

You can install the development version of `widepollution` from
[GitHub](https://github.com/rodrigomalagon/widepollution) with:

``` r
# install.packages("devtools")
devtools::install_github("rodrigomalagon/widepollution")
```

## Example

This is a basic example which shows you how to unpivot coupled time
series in a wide-format table:

``` r
library(widepollution)
df <- data.frame(a=c(1,2),
                  b=c(3,4),
                  X1=c(1,1),
                  Y1=c(10,10),
                  X2=c(2,2),
                  Y2=c(20,20),
                  X30=c(3,3),
                  Y30=c(30,30))
parallel_unpivot(df,'X','Y','X_series','Y_series','time','(X|Y)([[:digit:]]+)')|>
  rename_columns(c('X_series','Y_series'),c('X','Y'))
#>   a b time X  Y
#> 1 1 3    1 1 10
#> 2 1 3    2 2 20
#> 3 1 3   30 3 30
#> 4 2 4    1 1 10
#> 5 2 4    2 2 20
#> 6 2 4   30 3 30
```

Another functionality in our package is json-like list handling to
extract linestrings:

``` r
json_list <- list(
      features=list(
        list(
          geometry = list(
            coordinates =list(
              c(0,0),c(0,1),c(1,1),c(1,0),c(0,0)
            )
          )
        ),
        list(
          geometry = list(
            coordinates =list(
              c(0,0),c(0,3),c(3,0),c(0,0)
            )
          )
        ),
        list(
          geometry = list(
            coordinates =list(
              c(-1,0),c(1,0),c(1,1),c(0,2),c(-1,1),c(-1,0)
            )
          )
        )
      )
    )

#This will extract and plot the second geometry
extract_linestring_from_json_list(2,json_list)
#> LINESTRING (0 0, 0 3, 3 0, 0 0)
```
