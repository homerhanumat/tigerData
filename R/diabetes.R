#' Diabetes Risk
#'
#' @description Subset of survey data collected by the US National Center
#' for Health Statistics (NCHS). The original data was based on home interviews 
#' of about 5,000 people per years, from 1999-2004.
#'
#' @name diabetes
#' @docType data
#' @format A data frame with 9096 observations on the following 23 variables.
#' \describe{
#' \item{\code{sex}}{\code{"male"} or \code{"female"}}
#' \item{\code{age}}{age of subject in years}
#' \item{\code{pregnant}}{\code{"yes"} or \code{"no"}}
#' \item{\code{ethnicity}}{Mexican American,
#' Other Hispanic, Non-Hispanic White, Non-Hispanic Black, or Other/Multi}
#' \item{\code{smoker}}{\code{"yes"} or \code{"no"}}
#' \item{\code{diabetic}}{\code{"yes"} or \code{"no"}}
#' \item{\code{height}}{height (meters)}
#' \item{\code{weight}}{weight (kilograms)}
#' \item{\code{waist}}{waist circumference (meters)}
#' \item{\code{wci}}{the proposed body shape index}
#' \item{\code{bmi}}{body mass index}
#' \item{\code{ptfat}}{percent trunk fat}
#' \item{\code{tfat}}{mass of trunk fat}
#' \item{\code{lfat}}{limb fat}
#' \item{\code{llean}}{limb lean tissue}
#' \item{\code{lbmi}}{lean-tissue only BMI}
#' \item{\code{fbmi}}{fat-only BMI}
#' \item{\code{bbmi}}{bone BMI}
#' \item{\code{pfat}}{percent fat}
#' \item{\code{bmd}}{bone mineral density}
#' \item{\code{fmhm_other}}{Framingham risk score}
#' \item{\code{hdl}}{HDL cholesterol}
#' \item{\code{chol}}{cholesterol (LDL?)}
#' \item{\code{bps}}{systolic blood pressure, mmHg}
#' \item{\code{bpd}}{diastolic blood pressure, mmHg}
#' \item{\code{income}}{ratio of family income to poverty threshold. 
#' (5 stands for a ratio greater than or equal to 5)}
#' }
#' @source  Modified from \code{NCHS} in package \code{DataComputing}.
#' The original data is from NHANES, the National Health and
#' Nutrition Survey.
#' See \url{http://wwwn.cdc.gov/nchs/nhanes/search/nhanes03_04.aspx#}
#' for more infromation.
#' @keywords datasets
#'
NA