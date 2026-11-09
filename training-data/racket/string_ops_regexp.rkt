#lang racket
(displayln (string-upcase "hello"))
(displayln (string-join '("a" "b" "c") "-"))
(displayln (regexp-match #px"(\\d+)-(\\d+)" "tel 555-1234"))
(displayln (regexp-replace* #rx"o" "foo boo" "0"))
