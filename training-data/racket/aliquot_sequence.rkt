#lang racket
;; Aliquot sequence: replace n by the sum of its proper divisors.
(define (aliquot-sum n)
  (for/sum ([d (in-range 1 (add1 (quotient n 2)))] #:when (zero? (remainder n d))) d))

(define (aliquot n)
  (let loop ([x n] [acc '()] [count 0])
    (if (or (<= x 1) (>= count 19))
        (reverse (cons x acc))
        (loop (aliquot-sum x) (cons x acc) (add1 count)))))

(displayln (string-join (map number->string (aliquot 12)) " "))
