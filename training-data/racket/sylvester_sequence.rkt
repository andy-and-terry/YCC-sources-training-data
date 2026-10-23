#lang racket
;; Sylvester's sequence: s(0) = 2, s(n+1) = s(n)^2 - s(n) + 1
(for/fold ([s 2]) ([i (in-range 8)])
  (printf "s(~a) = ~a\n" i s)
  (+ (- (* s s) s) 1))
