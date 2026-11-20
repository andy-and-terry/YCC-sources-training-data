#lang racket
;; Shoelace polygon area.
(define (area pts)
  (define nxt (append (cdr pts) (list (car pts))))
  (/ (abs (for/sum ([a pts] [b nxt]) (- (* (car a) (cadr b)) (* (car b) (cadr a))))) 2))
(displayln (area '((0 0) (4 0) (4 3) (0 3))))
