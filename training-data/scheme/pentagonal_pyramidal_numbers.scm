; n^2(n+1)/2
(define (term n)
  (quotient ((n * n) * (n + 1)) 2))

(do ((n 1 (+ n 1)))
    ((> n 15))
  (display n)
  (display " -> ")
  (display (term n))
  (newline))
