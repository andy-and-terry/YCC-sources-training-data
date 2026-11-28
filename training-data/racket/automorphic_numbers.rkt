#lang racket

(define (automorphic? n)
  (string-suffix? (number->string (* n n)) (number->string n)))

(displayln (for/list ([n (in-range 0 1000)] #:when (automorphic? n)) n))
;; (0 1 5 6 25 76 376 625)
