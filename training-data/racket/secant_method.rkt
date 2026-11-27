#lang racket

(define (secant f x0 x1)
  (let loop ([n 50] [x0 x0] [x1 x1])
    (define f0 (f x0))
    (define f1 (f x1))
    (if (or (zero? n) (= f0 f1))
        x1
        (let ([next (- x1 (/ (* f1 (- x1 x0)) (- f1 f0)))])
          (if (< (abs (- next x1)) 1e-12) next (loop (sub1 n) x1 next))))))

(displayln (secant (lambda (x) (- (* x x) 2.0)) 1.0 2.0))
