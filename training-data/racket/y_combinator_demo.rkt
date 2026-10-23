#lang racket

;; Anonymous recursion via the applicative-order Y combinator.
(define Y
  (lambda (f)
    ((lambda (x) (f (lambda (v) ((x x) v))))
     (lambda (x) (f (lambda (v) ((x x) v)))))))

(define factorial
  (Y (lambda (self)
       (lambda (n)
         (if (zero? n) 1 (* n (self (- n 1))))))))

(define fib
  (Y (lambda (self)
       (lambda (n)
         (if (< n 2) n (+ (self (- n 1)) (self (- n 2))))))))

(displayln (factorial 10))
(displayln (map fib (range 10)))
