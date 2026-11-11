;; Square pyramidal numbers n(n+1)(2n+1)/6
(defn term [n] (quot (* (* n (+ n 1)) (+ (* 2 n) 1)) 6))

(println (map term (range 10)))
