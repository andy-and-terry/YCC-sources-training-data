(defn sigma [n] (reduce + (filter #(zero? (mod n %)) (range 1 (inc n)))))

(println (filter #(< (sigma %) (* 2 %)) (range 1 21)))
