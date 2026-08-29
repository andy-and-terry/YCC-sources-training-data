#lang racket

(define (min-coins coins amount)
  (define dp (make-vector (add1 amount) -1))
  (vector-set! dp 0 0)
  (for ([n (in-range 1 (add1 amount))])
    (for ([c coins])
      (when (and (<= c n) (not (= (vector-ref dp (- n c)) -1)))
        (let ([candidate (add1 (vector-ref dp (- n c)))])
          (when (or (= (vector-ref dp n) -1) (< candidate (vector-ref dp n)))
            (vector-set! dp n candidate))))))
  (vector-ref dp amount))

(displayln (min-coins '(1 2 5) 11))
