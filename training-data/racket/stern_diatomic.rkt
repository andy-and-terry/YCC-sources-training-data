#lang racket

(define (stern count)
  (define seq (make-vector (max count 2) 0))
  (vector-set! seq 1 1)
  (for ([i (in-range 2 count)])
    (define h (quotient i 2))
    (vector-set! seq i
                 (if (even? i)
                     (vector-ref seq h)
                     (+ (vector-ref seq h) (vector-ref seq (add1 h))))))
  (take (vector->list seq) count))

(displayln (stern 15)) ; (0 1 1 2 1 3 2 3 1 4 3 5 2 5 3)
