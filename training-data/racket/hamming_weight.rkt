#lang racket

(define (popcount n)
  (if (zero? n) 0 (add1 (popcount (bitwise-and n (sub1 n))))))

(displayln (popcount #b10110111))
