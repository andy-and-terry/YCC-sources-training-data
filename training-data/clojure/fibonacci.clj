(defn fib-seq []
  (map first (iterate (fn [[a b]] [b (+ a b)]) [0 1])))

(println (take 11 (fib-seq)))
