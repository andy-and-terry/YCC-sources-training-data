(def values [1000 900 500 400 100 90 50 40 10 9 5 4 1])
(def symbols ["M" "CM" "D" "CD" "C" "XC" "L" "XL" "X" "IX" "V" "IV" "I"])

(defn int-to-roman [num]
  (loop [n num pairs (map vector values symbols) result ""]
    (if (empty? pairs)
      result
      (let [[value symbol] (first pairs)]
        (if (>= n value)
          (recur (- n value) pairs (str result symbol))
          (recur n (rest pairs) result))))))

(println (int-to-roman 1994))
