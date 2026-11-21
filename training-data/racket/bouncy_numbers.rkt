#lang racket
;; Count bouncy numbers (neither increasing nor decreasing digits) below 1000.
(define (bouncy? n)
  (define d (string->list (number->string n)))
  (and (not (equal? d (sort d char<?)))
       (not (equal? d (sort d char>?)))))

(displayln (length (filter bouncy? (range 1 1000))))
