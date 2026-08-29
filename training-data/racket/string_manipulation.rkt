#lang racket

(define s "Hello, Racket World!")

(displayln (string-upcase s))
(displayln (string-downcase s))
(displayln (string-length s))
(displayln (string-split s " "))
(displayln (string-replace s "World" "Programming"))
