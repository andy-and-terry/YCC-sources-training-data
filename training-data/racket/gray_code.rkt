#lang racket

(define (gray-code n)
  (for/list ([i (in-range (expt 2 n))])
    (bitwise-xor i (arithmetic-shift i -1))))

(define (from-gray g)
  (let loop ([g g] [n 0])
    (if (zero? g) n (loop (arithmetic-shift g -1) (bitwise-xor n g)))))

(define codes (gray-code 3))
(displayln (map (lambda (c) (~r c #:base 2 #:min-width 3 #:pad-string "0")) codes))
(displayln (map from-gray codes))
