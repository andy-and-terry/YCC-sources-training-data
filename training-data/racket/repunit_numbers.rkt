#lang racket
;; Repunits: R_k = (10^k - 1) / 9, built as r = 10r + 1.
(displayln
 (string-join
  (let loop ([k 8] [r 1] [acc '()])
    (if (zero? k) (reverse acc) (loop (- k 1) (+ (* r 10) 1) (cons (number->string r) acc))))
  " "))
