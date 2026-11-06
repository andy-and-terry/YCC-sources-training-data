#lang racket
;; Highest value reached by the Collatz (hailstone) sequence from n.
(define (peak n)
  (let loop ([n n] [best n])
    (if (= n 1)
        best
        (let ([next (if (even? n) (quotient n 2) (+ (* 3 n) 1))])
          (loop next (max best next))))))

(displayln (peak 27))
