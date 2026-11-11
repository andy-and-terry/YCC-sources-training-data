#lang racket
;; Repunits: numbers made only of the digit 1.
(define (repunits count)
  (for/list ([i (in-range count)])
    (/ (- (expt 10 (+ i 1)) 1) 9)))

(displayln (repunits 5))
