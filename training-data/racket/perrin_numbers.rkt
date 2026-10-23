#lang racket
;; Perrin numbers: P(0) = 3, P(1) = 0, P(2) = 2, P(n) = P(n-2) + P(n-3)
(define (perrin count)
  (let loop ([k count] [a 3] [b 0] [c 2])
    (if (zero? k)
        '()
        (cons a (loop (sub1 k) b c (+ a b))))))

(displayln (string-join (map number->string (perrin 15)) " "))
