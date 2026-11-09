(println (reduce (fn [acc x] (if (> acc 10) (reduced acc) (+ acc x))) 0 (range 100)))
