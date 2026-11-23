; 6n(n-1)+1
(define (term n)
  (((6 * n) * (n - 1)) + 1))

(do ((n 1 (+ n 1)))
    ((> n 15))
  (display n)
  (display " -> ")
  (display (term n))
  (newline))
