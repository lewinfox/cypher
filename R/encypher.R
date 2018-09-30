#' ncypher
#'
#' @param plaintext A character vector of length 1 containing the text to be
#'   encyphered
#' @param key A character vector of length 1 containing the key to be used to
#'  encypher the plaintext
#' @return A character vector of length 1 containing the encyphered text
#' @export

encypher <- function(plaintext, key) {
  plaintext <- toupper(gsub(" ", "", plaintext))
  plaintext <- strsplit(plaintext, "")[[1]]
  key <- toupper(gsub(" ", "", key))
  key <- strsplit(key, "")[[1]]
  key <- rep(key, length(key) %% length(plaintext) + 1)
  key <- key[1:length(plaintext)]
  num_plain <- sapply(plaintext, match, LETTERS)
  num_key <- sapply(key, match, LETTERS)
  num_cypher <- mapply(cypher::modulo_add, num_plain, num_key)
  return(paste(LETTERS[num_cypher], collapse = ""))
}
