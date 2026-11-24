;; Repunits: R_n = 11...1 (n ones), built as R_{n-1}*10 + 1.
(let loop ((n 1) (r 0))
  (if (<= n 8)
      (let ((next (+ (* r 10) 1)))
        (display next)
        (if (= 0 (remainder next 3)) (display "  (divisible by 3)"))
        (newline)
        (loop (+ n 1) next))))
