#lang racket

(define (triangular count)
  (for/fold ([sum 0] [acc '()] #:result (reverse acc)) ([n (in-range 1 (add1 count))])
    (values (+ sum n) (cons (+ sum n) acc))))

(displayln (triangular 10))
