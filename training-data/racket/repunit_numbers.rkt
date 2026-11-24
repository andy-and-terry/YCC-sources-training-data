#lang racket
;; Repunits: R_n = 11...1 (n ones), built as R_{n-1}*10 + 1.
(for/fold ([r 0]) ([n (in-range 1 9)])
  (define next (+ (* r 10) 1))
  (printf "~a~a\n" next (if (zero? (remainder next 3)) "  (divisible by 3)" ""))
  next)
