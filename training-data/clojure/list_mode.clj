(defn modes [items]
  (let [counts (frequencies items)
        top (apply max (vals counts))]
    (sort (keep (fn [[k c]] (when (= c top) k)) counts))))

(println (modes [1 2 2 3 3 4]))
