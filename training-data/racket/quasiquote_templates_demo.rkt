#lang racket

(define name "Ada")
(define langs '(racket scheme))

(displayln `(user ,name (langs ,@langs) (count ,(length langs))))
(displayln `(1 ,(+ 1 1) ,@(map add1 '(2 3))))
(displayln `#(a ,(* 2 3)))
(displayln `(a . ,(+ 1 2)))

(define (make-adder-expr n)
  `(lambda (x) (+ x ,n)))

(define expr (make-adder-expr 10))
(displayln expr)
(displayln ((eval expr (make-base-namespace)) 5))

(define (render-html tag attrs . body)
  `(,tag ,(map (lambda (p) `(,(car p) ,(cdr p))) attrs) ,@body))
(displayln (render-html 'a '((href . "/x")) "link"))
