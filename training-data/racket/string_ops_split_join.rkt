#lang racket
(displayln (string-join (map string-upcase (string-split "a b c")) "-"))
(displayln (string-replace "hello" "l" "L"))
(displayln (regexp-match #px"(\\d+)-(\\d+)" "10-20"))
