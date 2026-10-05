(defn sum-of-squares [n]
  (->> (range 1 (inc n))
       (map #(* % %))
       (reduce +)))

(println (sum-of-squares 5))
(println (sum-of-squares 10))
(println (reduce + (map #(* % %) (filter even? (range 1 11)))))
