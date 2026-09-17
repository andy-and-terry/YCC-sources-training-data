(defn insertion-sort [coll]
  (reduce (fn [sorted x]
            (let [[before after] (split-with #(<= % x) sorted)]
              (concat before [x] after)))
          []
          coll))

(println (insertion-sort [5 2 9 1 5 6 3]))
