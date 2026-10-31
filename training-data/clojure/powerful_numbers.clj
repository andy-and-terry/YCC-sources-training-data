(defn prime-factors [n]
  (loop [n n p 2 acc []]
    (cond
      (= n 1) acc
      (> (* p p) n) (conj acc n)
      (zero? (mod n p)) (recur (quot n p) p (conj acc p))
      :else (recur n (inc p) acc))))

(defn powerful? [n]
  (every? #(>= % 2) (vals (frequencies (prime-factors n)))))

(println (filter powerful? (range 1 101)))
