(defn collatz-step [n]
  (if (even? n) (quot n 2) (inc (* 3 n))))

(defn collatz-seq [n]
  (take-while #(not= % 1) (iterate collatz-step n)))

(defn collatz-steps [n]
  (count (collatz-seq n)))

(println (concat (collatz-seq 6) [1]))
(doseq [n [1 6 7 27]]
  (println "collatz" n "=" (collatz-steps n) "steps"))
