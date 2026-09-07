#lang racket

(define (lis lst)
  (define vec (list->vector lst))
  (define n (vector-length vec))
  (define dp (make-vector n 1))
  (for ([i (in-range n)])
    (for ([j (in-range i)])
      (when (< (vector-ref vec j) (vector-ref vec i))
        (vector-set! dp i (max (vector-ref dp i) (add1 (vector-ref dp j)))))))
  (apply max (vector->list dp)))

(displayln (lis '(10 9 2 5 3 7 101 18)))
(displayln (lis '(0 1 0 3 2 3)))
