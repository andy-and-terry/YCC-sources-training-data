#lang racket
(define (secant f a b)
  (for/fold ([a a] [b b] #:result b) ([_ 40])
    (define fb (f b))
    (define fa (f a))
    (if (zero? (- fb fa)) (values a b)
        (values b (- b (/ (* fb (- b a)) (- fb fa)))))))
(displayln (real->decimal-string (secant (λ (x) (- (* x x) 2.0)) 1.0 2.0) 8))
