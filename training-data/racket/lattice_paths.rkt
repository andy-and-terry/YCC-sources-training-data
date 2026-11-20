#lang racket
;; Lattice paths with a mutable DP vector.
(define (lattice n)
  (define row (make-vector (add1 n) 1))
  (for* ([_ n] [j (in-range 1 (add1 n))])
    (vector-set! row j (+ (vector-ref row j) (vector-ref row (sub1 j)))))
  (vector-ref row n))
(displayln (lattice 3))
