(def fact [1 1 2 6 24 120 720 5040 40320 362880])

(defn factorion? [n]
  (= n (reduce + (map #(fact (Character/digit % 10)) (str n)))))

(println (filter factorion? (range 1 50000)))
