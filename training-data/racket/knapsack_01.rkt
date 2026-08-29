#lang racket

(define (knapsack weights values capacity)
  (define dp (make-vector (add1 capacity) 0))
  (for ([i (in-range (length weights))])
    (define w (list-ref weights i))
    (define v (list-ref values i))
    (for ([cap (in-range capacity (sub1 w) -1)])
      (vector-set! dp cap (max (vector-ref dp cap) (+ (vector-ref dp (- cap w)) v)))))
  (vector-ref dp capacity))

(displayln (knapsack '(2 3 4 5) '(3 4 5 6) 5))
