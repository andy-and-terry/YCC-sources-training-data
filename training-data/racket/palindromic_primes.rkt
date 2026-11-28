#lang racket
(require math/number-theory)

(define (palindrome? n)
  (define s (number->string n))
  (equal? s (list->string (reverse (string->list s)))))

(displayln (for/list ([n (in-range 2 200)] #:when (and (palindrome? n) (prime? n))) n))
;; (2 3 5 7 11 101 131 151 181 191)
