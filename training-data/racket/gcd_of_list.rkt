#lang racket

(define (gcd-all . nums) (apply gcd nums))

(displayln (gcd-all 12 18 24))
(displayln (gcd-all 7 13))
(displayln (lcm 4 6 10))
