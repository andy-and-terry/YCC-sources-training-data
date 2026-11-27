#lang racket

(define (fletcher16 bs)
  (define-values (s1 s2)
    (for/fold ([a 0] [b 0]) ([x (in-bytes bs)])
      (define a2 (modulo (+ a x) 255))
      (values a2 (modulo (+ b a2) 255))))
  (bitwise-ior (arithmetic-shift s2 8) s1))

(displayln (number->string (fletcher16 #"abcde") 16))
