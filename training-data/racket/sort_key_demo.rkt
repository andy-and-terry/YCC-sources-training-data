#lang racket

(define people '(("Cy" 31) ("Ann" 25) ("Bo" 31) ("Di" 19)))

(displayln (sort people < #:key cadr))
(displayln (sort people string<? #:key car))
(displayln (sort people > #:key cadr #:cache-keys? #t))

(displayln (sort '(3 1 2) <))
(displayln (sort '("pear" "fig" "banana") < #:key string-length))
(displayln (argmin cadr people))
(displayln (argmax cadr people))
