(defn collatz-step [n]
  (if (even? n) (quot n 2) (+ (* 3 n) 1)))

(defn collatz-sequence [n]
  (take-while #(not= % 1) (iterate collatz-step n)))

(def seq-with-end (concat (collatz-sequence 27) [1]))
(println seq-with-end)
(println "steps:" (dec (count seq-with-end)))
