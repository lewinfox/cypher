#' decypher
#'
#' @param cyphertext A character vector of length 1 containing the text to be
#'   decyphered.
#' @param key A character vector of length 1 containing the key used to encypher
#'   the cyphertext
#' @return A character vector of length 1 containing the decyphered text
#' @export

decypher <- function(cyphertext, key) {
  cyphertext <- toupper(gsub(" ", "", cyphertext))
  cyphertext <- strsplit(cyphertext, "")[[1]]
  key <- toupper(gsub(" ", "", key))
  key <- strsplit(key, "")[[1]]
  key <- rep(key, length(cyphertext) %/% length(key) + 1)
  key <- key[1:length(cyphertext)]
  num_cypher <- sapply(cyphertext, match, LETTERS)
  num_key <- sapply(key, match, LETTERS)
  num_plain <- mapply(cypher::modulo_subtract, num_cypher, num_key)
  return(paste(LETTERS[num_plain], collapse = ""))
}
