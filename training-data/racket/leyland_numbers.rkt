#lang racket

;; Leyland numbers: x^y + y^x for x >= y >= 2.
(define (leyland x y) (+ (expt x y) (expt y x)))

(displayln
 (string-join
  (for*/list ([x (in-range 2 5)] [y (in-range 2 (add1 x))])
    (number->string (leyland x y)))
  " "))
