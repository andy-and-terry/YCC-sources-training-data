(defn manhattan [a b]
  (reduce + (map (fn [x y] (Math/abs (- x y))) a b)))

(println (manhattan [1 2] [4 6]))
