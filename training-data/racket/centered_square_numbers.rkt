#lang racket
;; Centered square numbers 2n(n+1)+1
(define (term n) (+ (* (* 2 n) (+ n 1)) 1))

(displayln (string-join (map (compose number->string term) (range 10)) " "))
