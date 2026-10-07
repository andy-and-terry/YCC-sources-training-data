#lang racket

(displayln (regexp-match #rx"[0-9]+" "abc 123 def 456"))
(displayln (regexp-match* #rx"[0-9]+" "abc 123 def 456"))
(displayln (regexp-match #px"(\\d{4})-(\\d{2})-(\\d{2})" "date: 2024-03-15"))
(displayln (regexp-match? #px"^\\w+@\\w+\\.com$" "ann@example.com"))
(displayln (regexp-match? #px"^\\w+@\\w+\\.com$" "bad-address"))

(displayln (regexp-replace #rx"o" "foo boo" "0"))
(displayln (regexp-replace* #rx"o" "foo boo" "0"))
(displayln (regexp-replace* #px"(\\w+)@(\\w+)" "ann@home bob@work" "\\2:\\1"))
(displayln (regexp-replace* #px"\\d+" "a1 b22 c333" (lambda (m) (number->string (* 2 (string->number m))))))

(displayln (regexp-split #rx"," "a,b,,c"))
(displayln (regexp-split #px"\\s+" "split   on   spaces"))
(displayln (regexp-match-positions #rx"b+" "aabbbcc"))

(match (regexp-match #px"(\\w+)=(\\d+)" "width=80")
  [(list _ key value) (printf "~a is ~a\n" key (string->number value))]
  [#f (displayln "no match")])

(displayln (regexp-quote "a.b*c"))
(displayln (regexp-match #rx"(?i:HELLO)" "say hello"))
(displayln (regexp-match* #px"(\\w)(\\d)" "a1 b2 c3" #:match-select cdr))
