(defn digits [n]
  (map #(Character/digit % 10) (str n)))

(defn digital-root [n]
  (if (< n 10)
    n
    (recur (reduce + (digits n)))))

(println (digital-root 9875))
(println (digital-root 16))
(println (digital-root 0))
(println (map digital-root [38 493193 999]))
