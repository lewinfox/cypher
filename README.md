# cypher
R implementation of a [Vigniere cypher](http://crypto.interactive-maths.com/vigenegravere-cipher.html).

Contains four functions:

* `encrypt(plaintext, key)` Encrypts the string `plaintext` using the key `key`. `key` is recycled as many times as is necessary
to match the length of `plaintext`.

* `decrypt(cyphertext, key)` Decrypts the string `cyphertext` using the key `key`.

* `modulo_add(i, m, n)` and `modulo_subtract(i, m, n)` Adds (subtracts) `m` to `i` modulo `n`. Differs from the default R `%%`
implentation in that zero is excluded, so `modulo_add(10, 1, 10)` returns 1, not 10. `n` defaults to 26 as it is intended for
use with the alphabet.
