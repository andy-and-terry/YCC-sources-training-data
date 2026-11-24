#lang racket
;; Fibbinary numbers: no two adjacent 1 bits.
(define (fibbinary? n) (zero? (bitwise-and n (arithmetic-shift n -1))))

(displayln (string-join (map number->string (filter fibbinary? (range 50))) " "))
