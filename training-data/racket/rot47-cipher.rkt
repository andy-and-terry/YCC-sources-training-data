#lang racket
(define (rot47 s)
  (list->string
   (for/list ([c (in-string s)])
     (define n (char->integer c))
     (if (<= 33 n 126) (integer->char (+ 33 (modulo (+ (- n 33) 47) 94))) c))))
(define e (rot47 "Hello, World!"))
(displayln e)
(displayln (rot47 e))
