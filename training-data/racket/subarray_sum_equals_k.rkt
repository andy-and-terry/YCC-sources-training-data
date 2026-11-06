#lang racket
;; Count contiguous subarrays whose sum equals k (prefix sums + hash).
(define (count-subarrays nums k)
  (define seen (make-hash '((0 . 1))))
  (define total 0)
  (define cnt 0)
  (for ([x nums])
    (set! total (+ total x))
    (set! cnt (+ cnt (hash-ref seen (- total k) 0)))
    (hash-update! seen total add1 0))
  cnt)

(displayln (count-subarrays '(1 1 1) 2))
