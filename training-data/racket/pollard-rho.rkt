#lang racket
(define (rho n)
  (if (even? n)
      2
      (let loop ([x 2] [y 2])
        (define (f v) (modulo (+ (* v v) 1) n))
        (define x1 (f x))
        (define y1 (f (f y)))
        (define d (gcd (abs (- x1 y1)) n))
        (if (= d 1) (loop x1 y1) d))))

(define n 8051)
(define p (rho n))
(printf "~a = ~a * ~a\n" n p (quotient n p))
