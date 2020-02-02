context("Encyphering and decyphering")
library(cypher)

test_that("plaintext is correctly encyphered", {
  pt <- "Hello"
  key <- "key"
  ct <- encypher(plaintext = pt, key = key)
  expect_equal(ct, "SJKWT")
})

test_that("cyphertext is correctly decyphered", {
  ct <- "SJkWT"
  key <- "key"
  pt <- decypher(cyphertext = ct, key = key)
  expect_equal(pt, "HELLO")
})

test_that("letters wrap to A and Z correctly", {
  pt <- "XYZABC"
  key <- "AAAAAA"
  ct <- encypher(plaintext = pt, key = key)
  expect_equal(ct, "YZABCD")
  pt <- decypher(cyphertext = ct, key = key)
  expect_equal(pt, "XYZABC")
})
