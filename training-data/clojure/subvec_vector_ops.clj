(def v [10 20 30 40 50])

(println (subvec v 1 3))
(println (nth v 2) (get v 9) (v 4))
(println (assoc v 1 :x))
(println (vec (reverse v)))
(println (mapv inc v))
(println (reduce + (filterv even? [1 2 3 4])))
