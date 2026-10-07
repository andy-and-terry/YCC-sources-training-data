(defn collatz-next [n]
  (if (even? n)
    (quot n 2)
    (inc (* 3 n))))

(defn collatz-steps [n]
  (count (take-while #(not= % 1) (iterate collatz-next n))))

(doseq [n [1 6 7 27]]
  (println n "->" (collatz-steps n) "steps"))
