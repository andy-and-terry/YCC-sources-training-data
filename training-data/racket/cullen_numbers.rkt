#lang racket

;; Cullen numbers: C(n) = n * 2^n + 1
(define (cullen n) (+ (* n (expt 2 n)) 1))

(displayln (string-join (map number->string (map cullen (range 0 10))) " "))
