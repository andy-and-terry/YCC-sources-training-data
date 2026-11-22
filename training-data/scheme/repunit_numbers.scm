;; Repunits: R_k = (10^k - 1) / 9, built as r = 10r + 1.
(let loop ((k 0) (r 1))
  (when (< k 8)
    (display r) (display " ")
    (loop (+ k 1) (+ (* r 10) 1))))
(newline)
