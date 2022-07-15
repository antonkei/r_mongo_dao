library(mongolite)
library(jsonlite)

connection_string <- "mongodb://localhost:27017/r_education_path_test"

test_that("We can connect to Mongodb", {
  db <- mongo("questions", url = connection_string)
})

test_that("We can create a collection in Mongo", {
  questions <- mongo("questions", url = connection_string)
  values <- '{"text": "my question", "answers": [{"text": "my wrong answer text", "isCorrect": false}, {"text": "my right answer text", "isCorrect": true}]}'

  questions$insert(values)
})

test_that("We can create a new question", {

  question <- Question$new(NULL, NULL, NULL)
  question$text <- "What will be a resulted vector for c(1, FALSE)"
  question$type <- "single-option"
  answers <- c(
    Answer$new("[TRUE FALSE]", FALSE),
    Answer$new("[1 0]", TRUE)
  )
  question$answers <- answers
})


test_that("JSON serialization for nested classes", {
  question <- Question$new(NULL, NULL, NULL)
  question$text <- "What will be a resulted vector for c(1, FALSE)"
  question$type <- "single-option"
  answers <- list(
    Answer$new("[TRUE FALSE]", FALSE),
    Answer$new("[1 0]", TRUE)
  )
  question$answers <- answers

  print(jsonlite::toJSON(question$toList()), auto_unbox = TRUE, pretty = FALSE)

})

test_that("We can store a question to MongoDB", {

  question <- Question$new(NULL, NULL, NULL)
  question$text <- "What will be a resulted vector for c(1, FALSE)"
  question$type <- "single-option"
  answers <- list(
    Answer$new("[TRUE FALSE]", FALSE),
    Answer$new("[1 0]", TRUE)
  )
  question$answers <- answers


  questions <- mongo("questions", url = connection_string)
  print(jsonlite::toJSON(question$toList()), auto_unbox = TRUE, pretty = FALSE)
  questions$insert(question$toList())
})