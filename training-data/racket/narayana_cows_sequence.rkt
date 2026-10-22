#lang racket
;; Narayana's cows: N(0) = N(1) = N(2) = 1, N(n) = N(n-1) + N(n-3)
(define (cows count)
  (let loop ([k count] [a 1] [b 1] [c 1])
    (if (zero? k)
        '()
        (cons a (loop (sub1 k) b c (+ a c))))))

(displayln (string-join (map number->string (cows 15)) " "))
