#lang racket

(define (hanoi n from to via)
  (when (> n 0)
    (hanoi (sub1 n) from via to)
    (printf "move disk ~a from ~a to ~a\n" n from to)
    (hanoi (sub1 n) via to from)))

(hanoi 3 'A 'C 'B)
