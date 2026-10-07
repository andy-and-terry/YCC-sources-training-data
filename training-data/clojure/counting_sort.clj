(defn counting-sort [coll]
  (let [counts (frequencies coll)
        max-val (apply max coll)]
    (vec (mapcat (fn [v] (repeat (get counts v 0) v))
                 (range (inc max-val))))))

(println (counting-sort [4 2 2 8 3 3 1]))
