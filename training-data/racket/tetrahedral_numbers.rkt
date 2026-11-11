#lang racket
;; Tetrahedral numbers n(n+1)(n+2)/6
(define (term n) (quotient (* (* n (+ n 1)) (+ n 2)) 6))

(displayln (string-join (map (compose number->string term) (range 10)) " "))
