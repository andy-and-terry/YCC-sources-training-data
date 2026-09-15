(defn rod-cutting [prices n]
  (let [dp (reduce (fn [dp i]
                      (conj dp (apply max (map #(+ (prices (dec %)) (dp (- i %)))
                                                (range 1 (inc i))))))
                    [0]
                    (range 1 (inc n)))]
    (last dp)))

(println (rod-cutting [1 5 8 9 10 17 17 20] 8))
(println (rod-cutting [1 5 8 9 10 17 17 20] 4))
