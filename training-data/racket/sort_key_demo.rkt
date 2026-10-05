#lang racket

(struct person (name age) #:transparent)

(define people
  (list (person "Ann" 31) (person "Bob" 25) (person "Cy" 31) (person "Di" 19)))

(define (names ps) (map person-name ps))

(displayln (names (sort people < #:key person-age)))
(displayln (names (sort people > #:key person-age)))
(displayln (names (sort people string<? #:key person-name)))
(displayln (sort '("pear" "fig" "banana") < #:key string-length))
(displayln (sort '(3 1 2) <))
(displayln (argmin person-age people))
(displayln (person-name (argmax person-age people)))
(displayln (sort '((b . 2) (a . 2) (c . 1)) < #:key cdr))
