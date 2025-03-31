# Load necessary libraries
library(stringr)
library(testthat)

# Test 1: Check the length of a simple string
test_that("str_length returns correct length for simple strings", {
  expect_equal(str_length("hello"), 5)
})

# Test 2: Check the length of a string with whitespace
test_that("str_length counts whitespace correctly", {
  expect_equal(str_length("hello world"), 11)  # 10 characters
})

# Test 3: Check the length of a string with special characters
test_that("str_length counts special characters correctly", {
  expect_equal(str_length("hello!"), 6)  # 5 characters +
})

# Test 4: Check the behavior with NA values
test_that("str_length returns NA for NA input", {
  expect_equal(str_length(NA), NA)
})

# Test 5: Check the behavior with vector inputs
test_that("str_length works with vector inputs", {
  expect_equal(str_length(c("hello", "world")), c(5, 5))
})

# Test 6: Check the behavior with emoji
test_that("str_length counts emoji correctly", {
  expect_equal(str_length("😀"), 1)  # 1 :)
})

# Test 7: Check the behavior with Inf and -Inf
test_that("str_length returns NA for Inf and -Inf", {
  expect_equal(str_length(Inf), NA)
  expect_equal(str_length(-Inf), NA)
})