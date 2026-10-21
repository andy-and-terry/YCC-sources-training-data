#lang racket
;; Padovan numbers: P(n) = P(n-2) + P(n-3), P(0)=P(1)=P(2)=1
(define (padovan count)
  (let loop ([n count] [a 1] [b 1] [c 1])
    (if (zero? n)
        '()
        (cons a (loop (sub1 n) b c (+ a b))))))

(displayln (string-join (map number->string (padovan 15)) " "))
