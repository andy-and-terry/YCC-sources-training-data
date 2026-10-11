#lang racket

(define (rotate-left s k)
  (define n (string-length s))
  (define j (modulo k n))
  (string-append (substring s j) (substring s 0 j)))
(displayln (rotate-left "abcdef" 2))
(displayln (rotate-left "abcdef" 8))

(define (rotation? a b)
  (and (= (string-length a) (string-length b))
       (string-contains? (string-append a a) b)))
(displayln (rotation? "waterbottle" "erbottlewat"))
(displayln (rotation? "abc" "acb"))

(define (anagram-key w)
  (list->string (sort (string->list (string-downcase w)) char<?)))
(define groups (group-by anagram-key '("listen" "silent" "enlist" "google" "gogole" "cat")))
(displayln (sort (map length groups) >))
(displayln (anagram-key "Listen"))
