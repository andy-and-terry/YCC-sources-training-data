#lang racket
(require math/number-theory)

(define (rev n)
  (string->number (list->string (reverse (string->list (number->string n))))))

(displayln (for/list ([p (in-range 2 200)]
                      #:when (and (not (= p (rev p))) (prime? p) (prime? (rev p))))
             p))
;; (13 17 31 37 71 73 79 97 107 113 149 157 167 179 199)
