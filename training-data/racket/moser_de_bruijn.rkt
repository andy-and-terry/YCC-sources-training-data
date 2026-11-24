#lang racket
;; Moser-de Bruijn sequence: binary digits of n read in base 4.
(define (moser n)
  (string->number (number->string n 2) 4))

(displayln (string-join (map (compose number->string moser) (range 12)) " "))
