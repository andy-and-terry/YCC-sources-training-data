#lang racket

(struct point (x y) #:transparent)
(struct person (name age) #:transparent)

(define p (point 1 2))
(define p2 (struct-copy point p [x 10]))
(displayln p)
(displayln p2)
(displayln (equal? p (point 1 2)))
(displayln (eq? p (point 1 2)))

(define ann (person "Ann" 30))
(define older (struct-copy person ann [age (add1 (person-age ann))]))
(displayln older)
(displayln (struct->vector ann))
(displayln (point? p))
(displayln (person? p))
(define-values (a b) (match-let ([(point x y) p]) (values x y)))
(displayln (list a b))
(displayln (map point-x (list p p2)))
(displayln (sort (list p2 p) < #:key point-x))
(displayln (struct? p))
