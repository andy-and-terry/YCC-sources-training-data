#lang racket
(displayln (string-upcase "hello"))
(displayln (string-join '("a" "b" "c") ", "))
(displayln (string-split "x y  z"))
(displayln (string-replace "banana" "an" "AN"))
(displayln (regexp-match #rx"([0-9]+)-([0-9]+)" "tel 555-1234"))
(printf "~a ~s ~a\n" "plain" "quoted" (~r 3.14159 #:precision 2))
