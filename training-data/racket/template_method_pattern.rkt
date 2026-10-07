#lang racket

;; The template method: a fixed skeleton (load -> process -> sort) that
;; takes the varying "process" step as a procedure argument.
(define (run-pipeline load process)
  (sort (process (load)) <))

(define (load-data) '(3 1 4 1 5))

(define (double-all data) (map (lambda (x) (* x 2)) data))
(define (square-all data) (map (lambda (x) (* x x)) data))

(displayln (run-pipeline load-data double-all))
(displayln (run-pipeline load-data square-all))
