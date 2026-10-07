(defn bellman-ford [n edges source]
  (let [init (assoc (vec (repeat n Double/POSITIVE_INFINITY)) source 0.0)]
    (loop [dist init i 0]
      (if (= i (dec n))
        dist
        (recur
         (reduce
          (fn [dist [u v w]]
            (if (and (< (dist u) Double/POSITIVE_INFINITY)
                     (< (+ (dist u) w) (dist v)))
              (assoc dist v (+ (dist u) w))
              dist))
          dist
          edges)
         (inc i))))))

(def edges [[0 1 4] [0 2 5] [1 2 -3] [2 3 4] [1 3 6]])

(println (bellman-ford 4 edges 0))
