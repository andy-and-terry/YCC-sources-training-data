#lang racket

(define (normalize-str s)
  (list->string (sort (string->list (string-downcase (string-replace s " " ""))) char<?)))

(define (anagram? a b)
  (string=? (normalize-str a) (normalize-str b)))

(displayln (anagram? "listen" "silent"))
(displayln (anagram? "hello" "world"))
