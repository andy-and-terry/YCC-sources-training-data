#lang racket

(define (minimum-total triangle)
  (define rows (reverse triangle))
  (define (step below row)
    (for/list ([v (in-list row)] [l (in-list below)] [r (in-list (cdr below))])
      (+ v (min l r))))
  (first (foldl (λ (row below) (step below row)) (first rows) (rest rows))))

(displayln (minimum-total '((2) (3 4) (6 5 7) (4 1 8 3)))) ; 11
