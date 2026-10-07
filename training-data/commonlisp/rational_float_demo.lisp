;; Numeric tower: integers, ratios, floats, complex numbers.
(print (/ 1 3))
(print (+ 1/3 2/3))
(print (* 2 3/4))
(print (float 1/3))
(print (rational 0.5))
(print (numerator 6/8))
(print (denominator 6/8))
(print (/ 7 2.0))
(print (type-of 3/4))
(print (type-of 3.0d0))

;; rounding family returns two values
(print (multiple-value-list (floor 7 2)))
(print (multiple-value-list (ceiling 7 2)))
(print (multiple-value-list (truncate -7 2)))
(print (multiple-value-list (round 5 2)))
(print (multiple-value-list (round 7 2)))
(print (mod -7 3))
(print (rem -7 3))

;; bignums are automatic
(print (expt 2 100))
(print (* 99999999999 99999999999))
(print (isqrt 1000000))

;; complex numbers
(print (sqrt -4))
(print (* #c(1 2) #c(3 4)))
(print (abs #c(3 4)))
(print (realpart #c(5 6)))
