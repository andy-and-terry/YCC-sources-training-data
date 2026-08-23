(defn second-largest [coll]
  (second (sort > (distinct coll))))

(println (second-largest [5 3 8 1 9 2]))
