#lang racket
;; P(n) = 2*P(n-1) + P(n-2), with P(0) = 0 and P(1) = 1
(define (pell count)
  (let loop ([n count] [a 0] [b 1])
    (if (zero? n)
        '()
        (cons a (loop (sub1 n) b (+ (* 2 b) a))))))

(for ([p (pell 15)] [i (in-naturals)])
  (printf "P(~a) = ~a\n" i p))
