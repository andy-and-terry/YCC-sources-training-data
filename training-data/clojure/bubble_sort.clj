(defn bubble-sort [coll]
  (let [v (vec coll)
        n (count v)]
    (reduce
      (fn [v _]
        (reduce
          (fn [v i]
            (if (> (v i) (v (inc i)))
              (assoc v i (v (inc i)) (inc i) (v i))
              v))
          v
          (range (dec n))))
      v
      (range n))))

(println (bubble-sort [5 2 9 1 5 6]))
