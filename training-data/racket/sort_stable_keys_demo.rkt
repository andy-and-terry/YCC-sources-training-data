#lang racket

(define people '(("ann" 30) ("bob" 25) ("cy" 30) ("dee" 25)))
(displayln (sort people < #:key cadr))              ; stable
(displayln (sort people string<? #:key car #:cache-keys? #t))
(displayln (sort people > #:key cadr))
(displayln (sort '(3 1 2) >))
(displayln (sort '("pear" "fig" "apple") < #:key string-length))
(displayln (sort '(b a c) symbol<?))
(displayln (argmin cadr people))
(displayln (argmax cadr people))
(displayln (sort (list 1.5 1 2/3) <))
(displayln (sort (vector->list #(3 2 1)) <))
(define (sorted? lst) (or (null? lst) (null? (cdr lst)) (and (<= (car lst) (cadr lst)) (sorted? (cdr lst)))))
(displayln (sorted? '(1 2 2 3)))
(displayln (sorted? '(2 1)))
(displayln (group-by cadr people))
