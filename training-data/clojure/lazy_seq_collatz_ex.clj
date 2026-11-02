(defn collatz [n] (take-while #(not= % 1) (iterate #(if (even? %) (/ % 2) (inc (* 3 %))) n)))
(println (collatz 6))
