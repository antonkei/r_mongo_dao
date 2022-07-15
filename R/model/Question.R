Question <- R6::R6Class("Question", list(
  text = NULL,
  type = NULL,
  answers = list(),
  initialize = function (text, type = "single-option", answers) {
    self$text = text
    self$type = type
    self$answers = answers
  },
  toList = function () {
    return(list(
      text = self$text,
      type = self$type,
      answers = purrr::map(self$answers, ~.$toList())
    ))
  }
))