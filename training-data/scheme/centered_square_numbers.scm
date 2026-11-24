;; Centered square numbers: n^2 + (n+1)^2.
(do ((n 0 (+ n 1))) ((>= n 10))
  (display (+ (* n n) (* (+ n 1) (+ n 1)))) (display " "))
(newline)
