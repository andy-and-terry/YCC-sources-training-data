;; Tribonacci: T0=0, T1=0, T2=1, T(n) = T(n-1) + T(n-2) + T(n-3)
(def tribonacci
  (map first (iterate (fn [[a b c]] [b c (+ a b c)]) [0 0 1])))

(println "Tribonacci:" (take 15 tribonacci))
