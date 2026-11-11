;; Highest value reached by the Collatz (hailstone) sequence from n.
(defn step [n]
  (if (even? n) (quot n 2) (inc (* 3 n))))

(defn peak [n]
  (apply max (take-while #(not= % 1) (iterate step n))))

(println (peak 27))
