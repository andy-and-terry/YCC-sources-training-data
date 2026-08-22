#lang racket

(define (safe-divide a b)
  (with-handlers ([exn:fail? (lambda (e) 'undefined)])
    (/ a b)))

(displayln (safe-divide 10 2))
(displayln (safe-divide 5 0))
