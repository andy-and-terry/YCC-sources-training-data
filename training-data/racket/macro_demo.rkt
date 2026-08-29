#lang racket

(define-syntax-rule (my-unless test body)
  (if test (void) body))

(my-unless #f (displayln "this runs"))
(my-unless #t (displayln "this does not run"))
