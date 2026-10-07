#lang racket

(define (kth-largest nums k)
  (define sorted (sort nums >))
  (list-ref sorted (sub1 k)))

(displayln (kth-largest '(3 2 1 5 6 4) 2))
(displayln (kth-largest '(3 2 3 1 2 4 5 5 6) 4))
