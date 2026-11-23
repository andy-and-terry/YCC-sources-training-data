; n(n+1)(2n+1)/6
(define (term n)
  (quotient ((n * (n + 1)) * ((2 * n) + 1)) 6))

(do ((n 1 (+ n 1)))
    ((> n 15))
  (display n)
  (display " -> ")
  (display (term n))
  (newline))
