#lang racket
;; Centered square numbers: n^2 + (n+1)^2.
(displayln (string-join (for/list ([n 10]) (number->string (+ (sqr n) (sqr (add1 n))))) " "))
