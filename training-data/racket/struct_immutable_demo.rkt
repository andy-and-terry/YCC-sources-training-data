#lang racket

(struct point (x y) #:transparent)

(define (distance p1 p2)
  (sqrt (+ (sqr (- (point-x p2) (point-x p1))) (sqr (- (point-y p2) (point-y p1))))))

(displayln (distance (point 0 0) (point 3 4)))
