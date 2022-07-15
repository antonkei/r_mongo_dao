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

    answers = list()
    for (element in self$answers) {
      answers <- append(answers, element$toList())
    }


    return(list(
      text = self$text,
      type = self$type,
      answers = answers
    ))
  }
))