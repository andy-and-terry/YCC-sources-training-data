; n(2n^2+1)/3
(define (term n)
  (quotient (n * (((2 * n) * n) + 1)) 3))

(do ((n 1 (+ n 1)))
    ((> n 15))
  (display n)
  (display " -> ")
  (display (term n))
  (newline))
