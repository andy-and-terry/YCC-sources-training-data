#lang racket

(define (jaccard a b)
  (define sa (list->set a))
  (define sb (list->set b))
  (define u (set-count (set-union sa sb)))
  (if (zero? u) 1 (/ (set-count (set-intersect sa sb)) u)))

(displayln (jaccard '(1 2 3 4) '(3 4 5)))
