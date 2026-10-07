#lang racket

(define log-line "2024-03-01 ERROR disk full")

(define m (regexp-match #px"^(\\d{4})-(\\d{2})-(\\d{2}) (\\w+) (.*)$" log-line))
(displayln m)
(match-define (list _ year month day level msg) m)
(printf "~a/~a/~a [~a] ~a\n" month day year level msg)

(displayln (regexp-match* #px"\\d+" "a1 b22 c333"))
(displayln (regexp-replace* #px"\\s+" "too   many    spaces" " "))
(displayln (regexp-match? #rx"^[a-z]+$" "hello"))
(displayln (regexp-split #rx"," "a,b,,c"))
(displayln (regexp-replace #px"(\\w+)@(\\w+)" "bob@example" "\\2:\\1"))
