#lang racket

(displayln (~a "x=" 42 ", y=" 'sym))
(displayln (~a 7 #:min-width 5 #:align 'right #:left-pad-string "0"))
(displayln (~a "abcdefgh" #:max-width 5))
(displayln (~r 3.14159 #:precision 2))
(displayln (~r 255 #:base 16))
(displayln (~r 5 #:min-width 4 #:pad-string "0"))
(displayln (~s "quoted"))
(displayln (~v '(1 "two" three)))
(printf "~a | ~s | ~v\n" "str" "str" "str")
(displayln (format "~a-~a" 1 2))
