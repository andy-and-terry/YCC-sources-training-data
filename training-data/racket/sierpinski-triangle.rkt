#lang racket
(define n 8)
(for ([r (in-range n)])
  (display (make-string (- n r 1) #\space))
  (for ([c (in-range (add1 r))])
    (display (if (= (bitwise-and r c) c) "* " "  ")))
  (newline))
