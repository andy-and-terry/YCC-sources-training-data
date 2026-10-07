#lang racket

(define add3 (curry (lambda (a b c) (+ a b c))))
(define add5 ((add3 2) 3))
(displayln (add5 10))
(displayln ((add3 1 2) 3))

(define inc (curry + 1))
(define double (curry * 2))
(define inc-then-double (compose double inc))
(displayln (inc-then-double 4))
(displayln ((compose1 string-upcase symbol->string) 'abc))

(define (pipeline . fs)
  (lambda (x) (foldl (lambda (f acc) (f acc)) x fs)))
(displayln ((pipeline inc double sqr) 2))

(displayln (map (curryr - 1) '(10 20 30)))
(displayln (map (curry list 'tag) '(1 2)))
(displayln ((conjoin even? positive?) 4))
(displayln (filter (disjoin zero? negative?) '(-2 -1 0 1 2)))
(displayln ((negate even?) 3))
