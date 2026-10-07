#lang racket

(displayln (string-split "  a  b   c "))
(displayln (string-split "a,b,,c" ","))
(displayln (string-split "a,b,,c" "," #:trim? #f))
(displayln (string-join '("x" "y" "z") "-"))
(displayln (string-trim "  hi  "))
(displayln (string-trim "xxhixx" "x"))
(displayln (string-replace "a-b-c" "-" "+"))
(displayln (string-prefix? "racket" "rac"))
(displayln (string-suffix? "racket" "ket"))
(displayln (string-contains? "racket" "ack"))
(displayln (string-upcase "shout"))
