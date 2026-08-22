#lang racket

(struct point (x y) #:transparent)

(define (point-add a b)
  (point (+ (point-x a) (point-x b)) (+ (point-y a) (point-y b))))

(define p1 (point 1 2))
(define p2 (point 3 4))
(displayln (point-add p1 p2))
