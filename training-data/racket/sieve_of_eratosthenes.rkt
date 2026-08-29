#lang racket

(define (sieve limit)
  (define is-composite (make-vector (add1 limit) #f))
  (for ([i (in-range 2 (add1 (inexact->exact (floor (sqrt limit)))))])
    (unless (vector-ref is-composite i)
      (for ([j (in-range (* i i) (add1 limit) i)])
        (vector-set! is-composite j #t))))
  (for/list ([n (in-range 2 (add1 limit))]
             #:unless (vector-ref is-composite n))
    n))

(displayln (sieve 50))
