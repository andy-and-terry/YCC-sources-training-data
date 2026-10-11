#lang racket

(define name 'world)
(define nums '(1 2 3))
(displayln `(hello ,name))
(displayln `(sum ,(apply + nums)))
(displayln `(items ,@nums end))
(displayln `((a . ,(+ 1 1)) (b . ,(* 2 3))))
(displayln `#(1 ,(+ 1 1)))
(displayln `(1 `(2 ,(3 ,(+ 1 3)))))

(define (make-add-expr a b) `(+ ,a ,b))
(displayln (make-add-expr 3 4))
(displayln (eval (make-add-expr 3 4) (make-base-namespace)))

(define (make-let var val body) `(let ([,var ,val]) ,body))
(displayln (eval (make-let 'z 5 '(* z z)) (make-base-namespace)))
(displayln (quote (a . (b . (c)))))
(displayln '(quote x))
(displayln ''x)
