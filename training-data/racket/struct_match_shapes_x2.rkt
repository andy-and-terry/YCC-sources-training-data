#lang racket
(struct circle (r))
(struct rect (w h))
(define (area s)
  (match s
    [(circle r) (* 3.14159 r r)]
    [(rect w h) (* w h)]))
(displayln (area (rect 3 4)))
