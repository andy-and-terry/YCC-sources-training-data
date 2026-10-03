#lang racket

(struct circle (radius))
(struct square (side))
(struct rectangle (width height))

(define (shape-factory kind . args)
  (case kind
    [(circle) (circle (first args))]
    [(square) (square (first args))]
    [(rectangle) (rectangle (first args) (second args))]
    [else (error "unknown shape kind" kind)]))

(define (area shape)
  (cond
    [(circle? shape) (* pi (sqr (circle-radius shape)))]
    [(square? shape) (sqr (square-side shape))]
    [(rectangle? shape) (* (rectangle-width shape) (rectangle-height shape))]))

(for ([shape (list (shape-factory 'circle 2) (shape-factory 'square 3) (shape-factory 'rectangle 4 5))])
  (displayln (area shape)))
