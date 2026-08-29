#lang racket

(define (my-gcd a b)
  (if (= b 0) (abs a) (my-gcd b (remainder a b))))

(define (my-lcm a b)
  (/ (abs (* a b)) (my-gcd a b)))

(displayln (my-gcd 48 18))
(displayln (my-lcm 4 6))
