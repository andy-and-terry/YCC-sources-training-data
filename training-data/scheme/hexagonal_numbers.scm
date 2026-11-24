;; Hexagonal numbers: n(2n-1).
(do ((n 1 (+ n 1))) ((> n 10))
  (display (* n (- (* 2 n) 1))) (display " "))
(newline)
