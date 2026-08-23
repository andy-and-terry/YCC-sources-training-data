(println (reduce + 0 (range 1 11)))
(println (reduce max [5 3 8 1 9 2]))
(println (reduce (fn [acc x] (if (even? x) (conj acc x) acc)) [] (range 1 11)))
