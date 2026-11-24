;; Pentagonal numbers: n(3n-1)/2.
(do ((n 1 (+ n 1))) ((> n 10))
  (display (quotient (* n (- (* 3 n) 1)) 2)) (display " "))
(newline)
