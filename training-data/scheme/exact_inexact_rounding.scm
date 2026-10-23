;; Exact vs inexact numbers and the four rounding procedures.
(display (/ 1 3)) (newline)
(display (exact->inexact (/ 1 3))) (newline)
(display (inexact->exact 0.5)) (newline)

(display (list (floor 2.7) (ceiling 2.2) (truncate -2.7) (round 2.6)))
(newline)

;; round goes to even on ties
(display (list (round 0.5) (round 1.5) (round 2.5) (round 7/2)))
(newline)

(display (list (exact? 3) (exact? 3.0) (inexact? 1/2) (integer? 3.0)))
(newline)

(display (exact (round 3.7))) (newline)
(display (list (quotient 17 5) (remainder -17 5) (modulo -17 5)))
(newline)
(display (list (exact-integer? 5) (rational? 1/3) (number->string 255 16)))
(newline)
