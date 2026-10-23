#lang racket
;; List-based set operations and duplicate removal.

(define a '(1 2 3 4 4 5))
(define b '(4 5 6 7))

(displayln (remove-duplicates a))                    ; keeps first occurrence
(displayln (remove-duplicates '("A" "a" "B") string-ci=?))

;; remove-duplicates with #:key
(displayln (remove-duplicates '((1 . a) (2 . b) (1 . c)) #:key car))

;; union, intersection, difference on lists via filter/member
(define (union xs ys) (remove-duplicates (append xs ys)))
(define (inter xs ys) (filter (lambda (x) (member x ys)) (remove-duplicates xs)))
(define (diff xs ys) (filter (lambda (x) (not (member x ys))) (remove-duplicates xs)))

(displayln (union a b))
(displayln (inter a b))
(displayln (diff a b))

;; Dedicated list functions
(displayln (remq* '(4) a))
(displayln (remove* '(4 5) a))
(displayln (check-duplicates '(1 2 3 2 1)))
(displayln (check-duplicates '(1 2 3)))
