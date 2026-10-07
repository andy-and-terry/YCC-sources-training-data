#lang racket

;; Extended Euclid's algorithm returns gcd(a, b) along with Bezout
;; coefficients x, y such that a*x + b*y = gcd(a, b).
(define (extended-gcd a b)
  (if (zero? b)
      (values a 1 0)
      (let-values ([(g x1 y1) (extended-gcd b (modulo a b))])
        (values g y1 (- x1 (* (quotient a b) y1))))))

(define-values (g x y) (extended-gcd 30 20))
(displayln (list g x y))
(displayln (+ (* 30 x) (* 20 y)))
