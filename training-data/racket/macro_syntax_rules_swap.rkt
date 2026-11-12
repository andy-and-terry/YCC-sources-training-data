#lang racket
(define-syntax-rule (swap! a b) (let ([t a]) (set! a b) (set! b t)))
(define x 1) (define y 2)
(swap! x y)
(displayln (list x y))
