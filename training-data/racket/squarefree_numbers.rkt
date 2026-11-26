#lang racket
;; Squarefree numbers up to 100; expect 61.
(define (squarefree? n)
  (for/and ([d (in-range 2 (add1 (integer-sqrt n)))])
    (not (zero? (modulo n (* d d))))))
(displayln (for/sum ([n (in-range 1 101)]) (if (squarefree? n) 1 0)))
