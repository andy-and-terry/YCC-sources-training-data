(defn sigma [n] (reduce + (filter #(zero? (mod n %)) (range 1 (inc n)))))

(println (filter #(= (sigma (sigma %)) (* 2 %)) (range 1 100))) ; (2 4 16 64)
