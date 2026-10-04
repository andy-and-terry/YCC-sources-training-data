;; ratios stay exact
(println (/ 1 3))
(println (+ 1/3 2/3))
(println (* 3 (/ 1 3)))
(println (double 1/3))
(println (numerator 6/4) (denominator 6/4))

;; long overflow throws unless you use the primed operators
(println (try (+ Long/MAX_VALUE 1)
              (catch ArithmeticException e (.getMessage e))))
(println (+' Long/MAX_VALUE 1))
(println (*' 99999999999 99999999999))

;; arbitrary-precision literals
(println (* 2N 123456789012345678901234567890N))
(println (class 42) (class 42N) (class 1.5) (class 1.5M) (class 1/2))

;; BigDecimal avoids floating point surprises
(println (+ 0.1 0.2))
(println (+ 0.1M 0.2M))
(println (with-precision 5 (/ 1M 3)))

;; integer division helpers
(println (quot 17 5) (rem 17 5) (mod -17 5) (rem -17 5))
(println (bigint (Math/pow 2 70)))
