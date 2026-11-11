;; Tetrahedral numbers n(n+1)(n+2)/6
(defn term [n] (quot (* (* n (+ n 1)) (+ n 2)) 6))

(println (map term (range 10)))
