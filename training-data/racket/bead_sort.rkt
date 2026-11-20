#lang racket
;; Bead (gravity) sort.
(define (bead-sort nums)
  (define cols (for/list ([i (in-range 1 (add1 (apply max nums)))]) (count (λ (n) (>= n i)) nums)))
  (reverse (for/list ([r (in-range 1 (add1 (length nums)))]) (count (λ (c) (>= c r)) cols))))
(displayln (bead-sort '(5 3 1 4 2)))
