(defn sum-digits [n]
  (reduce + (map #(Character/getNumericValue %) (str n))))

(println (sum-digits 12345))
