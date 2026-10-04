#lang racket

(define s "the quick brown fox")

(displayln (string-split s))
(displayln (string-join (map string-upcase (string-split s)) "-"))
(displayln (string-split "a,b,,c" ","))
(displayln (string-split "a,b,,c" "," #:trim? #f))
(displayln (string-replace s "quick" "slow"))
(displayln (string-trim "  padded  "))
(displayln (string-prefix? s "the"))
(displayln (string-contains? s "brown"))
(displayln (list->string (reverse (string->list "abc"))))
(displayln (string-append* (add-between '("x" "y" "z") ", ")))
(displayln (regexp-match #rx"([a-z]+) ([a-z]+)" s))
(displayln (regexp-replace* #rx"o" s "0"))
(displayln (~a 42 #:width 6 #:align 'right))
(displayln (~r 3.14159 #:precision 2))
