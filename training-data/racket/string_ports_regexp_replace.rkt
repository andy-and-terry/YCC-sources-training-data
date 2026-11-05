#lang racket
(displayln (regexp-replace* #px"\\d+" "a1b22c333" "#"))
(displayln (regexp-match #px"(\\w+)@(\\w+)" "me@host"))
(displayln (call-with-output-string (λ (o) (fprintf o "~a-~a" 1 2))))
(displayln (string-join (map symbol->string '(a b c)) "/"))
