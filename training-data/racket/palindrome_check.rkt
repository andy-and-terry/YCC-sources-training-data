#lang racket

(define (palindrome? s)
  (define normalized
    (list->string (filter char-alphabetic? (string->list (string-downcase s)))))
  (string=? normalized (list->string (reverse (string->list normalized)))))

(displayln (palindrome? "A man, a plan, a canal: Panama"))
(displayln (palindrome? "hello"))
