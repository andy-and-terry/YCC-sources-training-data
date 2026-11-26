;; Deficient numbers below 100; expect 76.
(defn proper-sum [n] (reduce + (filter #(zero? (mod n %)) (range 1 n))))
(println (count (filter #(< (proper-sum %) %) (range 1 100))))
