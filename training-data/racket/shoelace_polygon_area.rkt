#lang racket

(define (area pts)
  (define nxt (append (rest pts) (list (first pts))))
  (/ (abs (for/sum ([p pts] [q nxt])
            (- (* (first p) (second q)) (* (first q) (second p)))))
     2))

(displayln (area '((0 0) (4 0) (4 3) (0 3))))
