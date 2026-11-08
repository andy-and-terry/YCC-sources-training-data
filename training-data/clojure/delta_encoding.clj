(defn delta-encode [xs]
  (into [(first xs)] (map - (rest xs) xs)))

(defn delta-decode [ds]
  (vec (reductions + ds)))

(let [d (delta-encode [10 12 15 15 20])]
  (println d)
  (println (delta-decode d)))
