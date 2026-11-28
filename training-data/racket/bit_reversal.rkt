#lang racket

(define (reverse-bits v [width 8])
  (for/fold ([acc 0]) ([i (in-range width)])
    (bitwise-ior (arithmetic-shift acc 1)
                 (bitwise-and (arithmetic-shift v (- i)) 1))))

(for ([v '(1 6 13 128)])
  (printf "~a ~a\n" v (reverse-bits v))) ; 128 96 176 1
