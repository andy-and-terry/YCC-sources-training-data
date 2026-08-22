#lang racket

(define scores (hash "Ada" 88 "Bob" 72 "Cleo" 95))

(for ([(name score) (in-hash scores)])
  (printf "~a: ~a\n" name score))

(displayln (hash-ref scores "Ada"))
(displayln (hash-has-key? scores "Zed"))
