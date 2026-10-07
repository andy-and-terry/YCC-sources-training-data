#lang racket

(struct circle (r))
(struct rect (w h))
(struct tri (a b c))

(define (area shape)
  (match shape
    [(circle r) (* pi r r)]
    [(rect w h) (* w h)]
    [(tri a b c)
     (let ([s (/ (+ a b c) 2)])
       (sqrt (* s (- s a) (- s b) (- s c))))]
    [_ (error 'area "unknown shape")]))

(displayln (area (rect 3 4)))
(displayln (area (tri 3 4 5)))
(displayln (real->decimal-string (area (circle 1)) 4))

(define (describe lst)
  (match lst
    ['() "empty"]
    [(list x) (format "one: ~a" x)]
    [(list x y) (format "two: ~a ~a" x y)]
    [(list x _ ... z) (format "first ~a last ~a" x z)]))

(displayln (map describe '(() (1) (1 2) (1 2 3 4))))
(match-define (list a b) '(10 20))
(displayln (+ a b))
