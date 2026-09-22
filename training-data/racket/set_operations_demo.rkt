#lang racket

(require racket/set)

(define a (set 1 2 3 4))
(define b (set 3 4 5 6))

(displayln (set->list (set-intersect a b)))
(displayln (set->list (set-union a b)))
(displayln (set->list (set-subtract a b)))
(displayln (set-member? a 2))
(displayln (subset? (set 1 2) a))

(define grown (set-add a 10))
(displayln (set->list grown))
