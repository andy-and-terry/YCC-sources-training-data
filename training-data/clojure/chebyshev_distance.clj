(defn chebyshev [a b]
  (apply max (map (fn [x y] (Math/abs (- x y))) a b)))

(println (chebyshev [1 2] [4 6]))
