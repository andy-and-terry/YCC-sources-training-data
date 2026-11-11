#lang racket
;; Population count (number of set bits) for 0..15
(define (bits n)
  (if (zero? n) 0 (+ (bitwise-and n 1) (bits (arithmetic-shift n -1)))))

(displayln (string-join (map (compose number->string bits) (range 16)) " "))
