#lang racket

(define (bubble-sort vec)
  (define n (vector-length vec))
  (for* ([i (in-range n)] [j (in-range (- n i 1))])
    (when (> (vector-ref vec j) (vector-ref vec (add1 j)))
      (define temp (vector-ref vec j))
      (vector-set! vec j (vector-ref vec (add1 j)))
      (vector-set! vec (add1 j) temp)))
  vec)

(displayln (bubble-sort (vector 5 2 9 1 5 6)))
