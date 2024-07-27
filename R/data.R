#' Madrid NOx 2023 pollution data
#'
#' A simple feature collection containing NOx data across different sampling stations of Madrid in 2023
#'
#' @format ## `nox_madrid`
#' Simple feature collection with 207096 features and 10 fields
#' Geometry type: POINT
#' Dimension:     XY
#' Bounding box:  xmin: -3.77461 ymin: 40.34715 xmax: -3.580026 ymax: 40.51807
#' Geodetic CRS:  WGS 8
#' \describe{
#'   \item{station_id}{Sampling station id}
#'   \item{pollutant_id}{Name of pollutant id}
#'   \item{month}{Month}
#'   \item{day}{Day}
#'   \item{hour}{Hour}
#'   \item{validation}{Measurement validation status}
#'   \item{measure}{Value measured}
#'   \item{pollutant_name}{Pollutant name}
#'   \item{unit}{Unity of measurement}
#'   \item{station}{Name of sampling station}
#'   \item{geometry}{Point location of station}
#' }
#' @source <https://datos.madrid.es/sites/v/index.jsp?vgnextoid=f3c0f7d512273410VgnVCM2000000c205a0aRCRD&vgnextchannel=374512b9ace9f310VgnVCM100000171f5a0aRCRD>
"nox_madrid"
