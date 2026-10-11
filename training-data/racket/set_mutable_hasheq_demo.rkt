#lang racket

(define s (mutable-set))
(set-add! s 1)
(set-add! s 2)
(set-add! s 2)
(displayln (set-count s))
(set-remove! s 1)
(displayln (set-member? s 1))
(displayln (sort (set->list s) <))

(define a (set 1 2 3))
(define b (set 3 4))
(displayln (sort (set->list (set-union a b)) <))
(displayln (set->list (set-intersect a b)))
(displayln (sort (set->list (set-subtract a b)) <))
(displayln (subset? (set 1) a))
(displayln (set-empty? (set)))

(define strs (list->set '("a" "b" "a")))
(displayln (set-count strs))
(define ids (seteq 'x 'y))
(displayln (set-member? ids 'x))
(displayln (for/set ([i (in-range 5)]) (modulo i 3)))
