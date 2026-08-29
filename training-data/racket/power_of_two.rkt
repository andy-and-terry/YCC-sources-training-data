#lang racket

(define (power-of-two? n)
  (and (> n 0) (= (bitwise-and n (sub1 n)) 0)))

(displayln (power-of-two? 16))
(displayln (power-of-two? 18))
