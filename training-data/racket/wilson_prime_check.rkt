#lang racket
;; Wilson's theorem primality test.
(define (wilson? n)
  (and (>= n 2) (= (for/fold ([f 1]) ([i (in-range 2 n)]) (modulo (* f i) n)) (sub1 n))))
(displayln (filter wilson? (range 2 20)))
