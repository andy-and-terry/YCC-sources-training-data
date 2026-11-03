(defn make-range-sum [values]
  (vec (reductions + 0 values)))

(defn query [prefix lo hi]
  (- (prefix hi) (prefix lo)))

(println (query (make-range-sum [3 1 4 1 5 9 2 6]) 2 5))
