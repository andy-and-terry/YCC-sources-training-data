; n(n+1)/2+1
(define (term n)
  ((quotient (n * (n + 1)) 2) + 1))

(do ((n 1 (+ n 1)))
    ((> n 15))
  (display n)
  (display " -> ")
  (display (term n))
  (newline))
