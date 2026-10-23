#lang racket

;; Woodall numbers: W(n) = n * 2^n - 1
(define (woodall n) (- (* n (expt 2 n)) 1))

(displayln (string-join (map number->string (map woodall (range 1 11))) " "))
