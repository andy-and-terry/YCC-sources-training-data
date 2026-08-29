#lang racket

(define (word-frequency text)
  (define freq (make-hash))
  (for ([word (string-split (string-downcase text) " ")])
    (hash-update! freq word add1 0))
  freq)

(displayln (word-frequency "the quick brown fox the lazy fox"))
