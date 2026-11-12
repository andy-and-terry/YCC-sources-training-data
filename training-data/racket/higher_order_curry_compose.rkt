#lang racket
(define add3 (curry + 3))
(displayln ((compose add1 add3) 1))
(displayln (foldl cons '() '(1 2 3)))
(displayln (apply max '(3 9 2)))
