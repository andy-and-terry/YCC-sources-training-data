(defn quickselect [coll k]
  (let [v (vec coll)
        pivot (rand-nth v)
        lows (filter #(< % pivot) v)
        highs (filter #(> % pivot) v)
        pivots (filter #(= % pivot) v)]
    (cond
      (< k (count lows)) (recur lows k)
      (< k (+ (count lows) (count pivots))) pivot
      :else (recur highs (- k (count lows) (count pivots))))))

(def data [7 2 9 4 1 8 3])
(println "3rd smallest:" (quickselect data 2))
(println "sorted for reference:" (sort data))
