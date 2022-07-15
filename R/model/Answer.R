Answer <- R6::R6Class("Answer", public = list(
  text = NULL,
  isCorrect = FALSE,
  initialize = function (text = NA, isCorrect = FALSE) {
    self$text <- text
    self$isCorrect <- isCorrect
  },
  toList = function () {
    return(list(
      text = self$text, isCorrect = self$isCorrect
    ))
  }
))