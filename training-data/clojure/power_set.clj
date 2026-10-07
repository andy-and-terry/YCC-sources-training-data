(defn power-set [coll]
  (reduce
    (fn [subsets item]
      (into subsets (map #(conj % item) subsets)))
    [[]]
    coll))

(doseq [subset (power-set [1 2 3])]
  (println subset))
