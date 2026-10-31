(defn digits [n] (map #(Character/digit % 10) (str n)))

(defn alternating-digit-sum [n]
  (reduce + (map * (cycle [1 -1]) (reverse (digits n)))))

(doseq [n [1234 99999 1000]]
  (println n (alternating-digit-sum n)))
