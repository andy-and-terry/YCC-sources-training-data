(defn pieces [cuts] (quot (+ (* cuts cuts) cuts 2) 2))

(println (map pieces (range 10))) ; (1 2 4 7 11 16 22 29 37 46)
