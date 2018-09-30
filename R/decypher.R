#' Decipher
#'
#' @param cyihertext A character vector of length 1 containing the text to be
#'   deciphered.
#' @param key A character vector of length 1 containing the key used to encipher
#'   the ciphertext
#' @return A character vector of length 1 containing the deciphered text
#' @export

decipher <- function(ciphertext, key) {
  ciphertext <- toupper(gsub(" ", "", ciphertext))
  ciphertext <- strsplit(ciphertext, "")[[1]]
  key <- toupper(gsub(" ", "", key))
  key <- strsplit(key, "")[[1]]
  key <- rep(key, length(ciphertext) %/% length(key) + 1)
  key <- key[1:length(ciphertext)]
  num_cipher <- sapply(ciphertext, match, LETTERS)
  num_key <- sapply(key, match, LETTERS)
  num_plain <- mapply(cipher::modulo_subtract, num_cipher, num_key)
  return(paste(LETTERS[num_plain], collapse = ""))
}
