#lang racket
(define (area pts)
  (/ (abs (for/sum ([p pts] [q (append (rest pts) (list (first pts)))])
            (- (* (car p) (cdr q)) (* (car q) (cdr p)))))
     2))
(displayln (area '((0 . 0) (4 . 0) (4 . 3) (0 . 3))))
