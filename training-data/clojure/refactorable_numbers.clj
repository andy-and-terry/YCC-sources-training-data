(defn tau [n] (count (filter #(zero? (mod n %)) (range 1 (inc n)))))

(println (filter #(zero? (mod % (tau %))) (range 1 60))) ; (1 2 8 9 12 18 24 36 40 56)
