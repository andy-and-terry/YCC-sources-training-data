#lang racket
(define (hanoi n from via to)
  (if (zero? n)
      '()
      (append (hanoi (sub1 n) from to via)
              (list (format "~a->~a" from to))
              (hanoi (sub1 n) via from to))))
(define m (hanoi 3 "A" "B" "C"))
(printf "~a: ~a\n" (length m) m)
