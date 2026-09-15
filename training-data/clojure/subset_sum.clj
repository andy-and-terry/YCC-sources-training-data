(defn subset-sum? [coll target]
  (let [possible (reduce
                   (fn [sums x]
                     (into sums (map #(+ % x) sums)))
                   #{0}
                   coll)]
    (contains? possible target)))

(println (subset-sum? [3 34 4 12 5 2] 9))
(println (subset-sum? [3 34 4 12 5 2] 10))
(println (subset-sum? [3 34 4 12 5 2] 100))
