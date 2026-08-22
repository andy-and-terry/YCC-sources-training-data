#lang racket

(define (my-gcd a b)
  (if (= b 0) a (my-gcd b (modulo a b))))

(displayln (my-gcd 48 18))
(displayln (my-gcd 100 75))
