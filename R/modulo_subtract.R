#' 1-indexed modular subtraction
#'
#' Provides modular subtraction with zero excluded.
#'
#' @param i Starting number
#' @param m Number to be subtracted
#' @param n Modulus. Defaults to 26 for alphabetic modular arithmetic
#'
#' @export
modulo_subtract <- function(i, m, n = 26) {
  ((i - m + n - 1) %% n) + 1
}
