#lang racket

(struct point (x y) #:transparent)
(struct point3 point (z) #:transparent)

(define p (point 1 2))
(define q (point3 1 2 3))

(displayln p)
(displayln (point-x q))
(displayln (point? q))
(displayln (equal? p (point 1 2)))
(displayln (struct-copy point p [y 20]))
