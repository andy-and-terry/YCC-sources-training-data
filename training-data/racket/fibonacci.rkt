#lang racket

(define cache (make-hash))

(define (fibonacci n)
  (cond
    [(< n 2) n]
    [(hash-has-key? cache n) (hash-ref cache n)]
    [else
     (define result (+ (fibonacci (- n 1)) (fibonacci (- n 2))))
     (hash-set! cache n result)
     result]))

(displayln (map fibonacci (range 10)))
