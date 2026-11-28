#lang racket
(define-syntax-rule (swap! a b)
  (let ([tmp a]) (set! a b) (set! b tmp)))

(define x 1)
(define y 2)
(swap! x y)
(displayln (list x y))
