;; Integer (1..3999) to Roman numeral using a greedy table.
(def table
  [[1000 "M"] [900 "CM"] [500 "D"] [400 "CD"] [100 "C"] [90 "XC"]
   [50 "L"] [40 "XL"] [10 "X"] [9 "IX"] [5 "V"] [4 "IV"] [1 "I"]])

(defn to-roman [n]
  (loop [n n, [[value sym] & more :as tbl] table, out ""]
    (cond
      (zero? n) out
      (>= n value) (recur (- n value) tbl (str out sym))
      :else (recur n more out))))

(println (to-roman 1994) (to-roman 58))
