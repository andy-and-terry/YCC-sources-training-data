; n(n+1)(n+2)(n+3)/24
(define (term n)
  (quotient (((n * (n + 1)) * (n + 2)) * (n + 3)) 24))

(do ((n 1 (+ n 1)))
    ((> n 15))
  (display n)
  (display " -> ")
  (display (term n))
  (newline))
