#lang racket
;; Vector construction and bulk operations.

(define squares (build-vector 6 (lambda (i) (* i i))))
(displayln squares)

(define v (vector 5 3 8 1))
(displayln (vector-map add1 v))
(vector-map! (lambda (x) (* x 10)) v)        ; in-place
(displayln v)

(define w (make-vector 4 0))
(vector-copy! w 1 #(7 8))                    ; copy into offset 1
(displayln w)
(displayln (vector-copy v 1 3))               ; slice [1,3)

(displayln (vector->list (vector-take #(a b c d) 2)))
(displayln (vector-count even? #(1 2 3 4 6)))
(displayln (vector-argmin (lambda (x) (abs (- x 5))) #(1 4 9 6)))

;; for/vector with #:length preallocates.
(displayln (for/vector #:length 5 ([i (in-range 5)]) (expt 2 i)))
(displayln (vector-append #(1 2) #(3)))
(displayln (vector-member 8 #(5 8 2)))
