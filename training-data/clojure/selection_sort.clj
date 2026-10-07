(defn selection-sort [coll]
  (let [n (count coll)]
    (loop [arr (vec coll) i 0]
      (if (>= i n)
        arr
        (let [min-idx (reduce (fn [m j] (if (< (nth arr j) (nth arr m)) j m))
                               i (range (inc i) n))
              arr (if (= min-idx i)
                    arr
                    (assoc arr i (nth arr min-idx) min-idx (nth arr i)))]
          (recur arr (inc i)))))))

(println (selection-sort [5 2 9 1 5 6]))
(println (selection-sort [3 1 2]))
