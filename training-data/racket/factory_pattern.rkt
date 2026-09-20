#lang racket

;; A factory function centralizes construction so callers ask for a
;; shape by name instead of knowing which struct to instantiate.
(struct circle (radius) #:transparent)
(struct square (side) #:transparent)

(define (shape-area shape)
  (cond
    [(circle? shape) (* pi (sqr (circle-radius shape)))]
    [(square? shape) (sqr (square-side shape))]
    [else (error 'shape-area "unknown shape: ~a" shape)]))

(define (make-shape kind param)
  (case kind
    [(circle) (circle param)]
    [(square) (square param)]
    [else (error 'make-shape "unknown kind: ~a" kind)]))

(for ([s (list (make-shape 'circle 2) (make-shape 'square 3))])
  (printf "~a has area ~a\n" s (real->decimal-string (shape-area s) 2)))
