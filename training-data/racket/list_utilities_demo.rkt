#lang racket

(define xs '(1 2 3 4 5 6 7 8))

(displayln (take xs 3))
(displayln (drop xs 5))
(call-with-values (lambda () (split-at xs 2)) (lambda (a b) (displayln (list a b))))
(call-with-values (lambda () (partition even? xs)) (lambda (e o) (displayln (list e o))))
(displayln (takef xs (lambda (x) (< x 4))))
(displayln (remove-duplicates '(1 2 1 3 2)))
(displayln (group-by (lambda (x) (modulo x 3)) xs))
(displayln (append-map (lambda (x) (list x x)) '(a b)))
(displayln (flatten '(1 (2 (3 4)) 5)))
(displayln (index-of '(a b c) 'c))
(displayln (range 0 10 3))
(displayln (add-between '(a b c) '-))
(displayln (list-set '(a b c) 1 'z))
(displayln (count even? xs))
