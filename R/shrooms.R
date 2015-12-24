#' Can You Eat This Mushroom?
#'
#' @description Subset of data from a study on edibility of mushrroms.
#' The individual mushrooms come from 23 species of gilled mushrooms 
#' in the Agaricus and Lepiota Family.  The aim is to come up with a rule
#' for predicting, on the basis of an individual mushroom's characteristics,
#' whether or not the mushroom is edible.  Remaining data is held back
#' for evaluation of proposed rules.
#'
#' @name shrooms
#' @docType data
#' @format A data frame with 5891 observations on the following 23 variables.
#' \describe{ 
#' \item{class}{Whether the mushroom is edible or poisonous.}
#' \item{cap.shape}{}
#' \item{cap.surface}{}
#' \item{cap.color}{}
#' \item{bruises}{Whether or not the mushroom is bruised.}{}
#' \item{odor}{}
#' \item{gill.attachment}{}
#' \item{gill.spacing}{}
#' \item{gill.size}{}
#' \item{gill.color}{}
#' \item{stalk.shape}{}
#' \item{stalk.root}{}
#' \item{stalk.surface.above.ring}{}
#' \item{stalk.surface.below.ring}{}
#' \item{stalk.color.above.ring}{}
#' \item{stalk.color.below.ring}{}
#' \item{veil.type}{}
#' \item{veil.color}{}
#' \item{ring.number}{}
#' \item{ring.type}{}
#' \item{spore.print.color}{}
#' \item{population}{}
#' \item{habitat}{}
#' }
#' @source  A sample from of mushroom records drawn from The Audubon Society 
#' Field Guide to North American Mushrooms (1981). G. H. Lincoff (Pres.), 
#' New York: Alfred A. Knopf,  Original data contributed by Jeffrey
#' Schlimmer to the UCI Machine Learning Repository 
#' (\url{http://archive.ics.uci.edu/ml}, Irvine, CA: University of 
#' California, School of Information and Computer Science.   See
#' \url{http://archive.ics.uci.edu/ml/datasets/Mushroom}.
#' @keywords datasets
#'
NA