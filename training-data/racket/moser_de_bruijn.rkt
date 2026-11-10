#lang racket
;; Read the binary digits of i as base-4 digits.
(define (moser i) (if (zero? i) 0 (string->number (number->string i 2) 4)))
(displayln (for/list ([i 10]) (moser i))) ; (0 1 4 5 16 17 20 21 64 65)
