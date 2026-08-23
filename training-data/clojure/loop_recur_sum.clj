(defn sum-to [n]
  (loop [i 1 acc 0]
    (if (> i n) acc (recur (inc i) (+ acc i)))))

(println (sum-to 100))
