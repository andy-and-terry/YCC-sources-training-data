#lang racket

(define (my-power base exp)
  (cond
    [(= exp 0) 1]
    [(even? exp) (let ([half (my-power base (quotient exp 2))]) (* half half))]
    [else (* base (my-power base (sub1 exp)))]))

(displayln (my-power 2 10))
(displayln (my-power 3 5))
