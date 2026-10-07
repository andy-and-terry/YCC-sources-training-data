#lang racket

;; `sort` takes an optional #:key and #:cache-keys? for expensive keys.
(define people '(("Cy" . 30) ("Al" . 25) ("Bo" . 30)))

(displayln (sort people < #:key cdr))
(displayln (sort people string<? #:key car))
(displayln (sort '("banana" "Apple" "cherry") string<? #:key string-downcase #:cache-keys? #t))
(displayln (sort '(3 1 2) >))
(displayln (sort (vector->list (vector 5 4 6)) <))
