#lang racket

(define (swap-case s)
  (list->string
   (for/list ([c (in-string s)])
     (if (char-upper-case? c) (char-downcase c) (char-upcase c)))))

(displayln (swap-case "Hello World 42"))
