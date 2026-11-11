#lang racket

(define (insert-interval ivs new)
  (define-values (before rest) (splitf-at ivs (λ (iv) (< (second iv) (first new)))))
  (define-values (overlap after) (splitf-at rest (λ (iv) (<= (first iv) (second new)))))
  (define lo (apply min (first new) (map first overlap)))
  (define hi (apply max (second new) (map second overlap)))
  (append before (list (list lo hi)) after))

(displayln (insert-interval '((1 3) (6 9)) '(2 5))) ; ((1 5) (6 9))
