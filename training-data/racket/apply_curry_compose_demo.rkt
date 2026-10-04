#lang racket

(displayln (apply + 1 2 '(3 4 5)))
(displayln (apply max '(3 9 2)))
(displayln (apply string-append (map symbol->string '(a b c))))
(displayln (apply map list '((1 2 3) (4 5 6))))

(define add3 (curry + 3))
(displayln (add3 4))
(displayln (((curry (lambda (a b c) (list a b c))) 1) 2 3))
(displayln (map (curryr - 1) '(10 20 30)))
(displayln (map (curry * 2) '(1 2 3)))

(define inc (lambda (x) (+ x 1)))
(define double (lambda (x) (* x 2)))
(define inc-then-double (compose double inc))
(define double-then-inc (compose1 inc double))
(displayln (list (inc-then-double 5) (double-then-inc 5)))

(displayln ((conjoin even? positive?) 4))
(displayln ((disjoin even? negative?) 3))
(displayln (filter (negate even?) '(1 2 3 4 5)))
(displayln ((const 7) 'ignored 'args))
(displayln (map (lambda (f) (f 10)) (list inc double sqrt)))
(displayln ((thunk 42)))
(displayln (foldl (lambda (f acc) (f acc)) 3 (list inc double inc)))
