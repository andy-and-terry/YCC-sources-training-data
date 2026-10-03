(defn transpose [m]
  (apply mapv vector m))

(defn matrix-multiply [a b]
  (let [bt (transpose b)]
    (mapv (fn [row] (mapv #(reduce + (map * row %)) bt)) a)))

(def a [[1 2] [3 4]])
(def b [[5 6] [7 8]])

(doseq [row (matrix-multiply a b)]
  (println row))
