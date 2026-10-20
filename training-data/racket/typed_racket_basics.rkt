#lang typed/racket
(: add (-> Number Number Number))
(define (add a b) (+ a b))
(displayln (add 1 2.5))

(: safe-head (All (A) (-> (Listof A) (Option A))))
(define (safe-head l) (if (null? l) #f (car l)))
(displayln (safe-head '(1 2)))
(displayln (safe-head '()))

(struct pt ([x : Real] [y : Real]))
(: dist (-> pt Real))
(define (dist p) (sqrt (+ (* (pt-x p) (pt-x p)) (* (pt-y p) (pt-y p)))))
(displayln (dist (pt 3 4)))

(define-type Shape (U Circle Square))
(struct Circle ([r : Real]))
(struct Square ([s : Real]))
(: area (-> Shape Real))
(define (area s) (cond [(Circle? s) (* 3 (Circle-r s) (Circle-r s))] [else (* (Square-s s) (Square-s s))]))
(displayln (area (Square 4)))
