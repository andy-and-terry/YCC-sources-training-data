(def tri-seq (map (fn [n] (/ (* n (inc n)) 2)) (iterate inc 1)))

(println (take 10 tri-seq))
