#lang racket
(struct point (x y) #:transparent)
(define (quadrant p)
  (match p
    [(point x y) #:when (and (> x 0) (> y 0)) 'first]
    [(point 0 _) 'axis]
    [_ 'other]))
(displayln (list (quadrant (point 1 2)) (quadrant (point 0 5))))
