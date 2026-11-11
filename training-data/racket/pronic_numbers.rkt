#lang racket
;; Pronic numbers n(n+1)
(define (term n) (* n (+ n 1)))

(displayln (string-join (map (compose number->string term) (range 10)) " "))
