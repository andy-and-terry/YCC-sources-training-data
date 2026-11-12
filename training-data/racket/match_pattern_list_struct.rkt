#lang racket
(struct pt (x y))
(define (describe v)
  (match v
    [(pt x y) #:when (= x y) 'diagonal]
    [(pt x y) (list x y)]
    [(list a b ...) (list 'head a 'rest b)]
    [_ 'other]))
(displayln (map describe (list (pt 1 1) (pt 1 2) '(1 2 3) 5)))
