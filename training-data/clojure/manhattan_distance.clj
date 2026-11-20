;; Manhattan distance.
(defn manhattan [a b] (reduce + (map #(Math/abs (- %1 %2)) a b)))
(println (manhattan [1 2] [4 6]))
