#' 1-indexed modular addition
#'
#' Provides modular addition with zero excluded.
#'
#' @param i Starting number
#' @param m Number to be added
#' @param n Modulus. Defaults to 26 for alphabetic modular arithmetic
#'
#' @export
modulo_add <- function(i, m, n = 26) {
  ((i + m - 1) %% n) + 1
}
