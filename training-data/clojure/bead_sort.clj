;; Bead (gravity) sort.
(defn bead-sort [nums]
  (let [cols (for [i (range 1 (inc (apply max nums)))] (count (filter #(>= % i) nums)))]
    (reverse (for [r (range 1 (inc (count nums)))] (count (filter #(>= % r) cols))))))

(println (bead-sort [5 3 1 4 2]))
