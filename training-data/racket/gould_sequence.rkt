#lang racket

(define (popcount n) (if (zero? n) 0 (+ (bitwise-and n 1) (popcount (arithmetic-shift n -1)))))
(define (gould n) (arithmetic-shift 1 (popcount n)))

(displayln (map gould (range 16)))
