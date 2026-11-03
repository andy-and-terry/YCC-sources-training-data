#lang racket

(define (count-vowels s)
  (define lower (string-downcase s))
  (for/list ([v (in-string "aeiou")])
    (cons v (for/sum ([c (in-string lower)]) (if (char=? c v) 1 0)))))

(displayln (count-vowels "Education is beautiful"))
