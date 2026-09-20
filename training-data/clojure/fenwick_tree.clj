(def size 8)
(def tree (atom (vec (repeat (inc size) 0))))

(defn fen-update! [i delta]
  (loop [idx (inc i)]
    (when (<= idx size)
      (swap! tree update idx + delta)
      (recur (+ idx (bit-and idx (- idx)))))))

(defn prefix-sum [i]
  (loop [idx (inc i)
         total 0]
    (if (pos? idx)
      (recur (- idx (bit-and idx (- idx))) (+ total (@tree idx)))
      total)))

(defn range-sum [l r]
  (- (prefix-sum r) (if (pos? l) (prefix-sum (dec l)) 0)))

(def values [1 3 5 7 9 11 13 15])
(doseq [i (range size)] (fen-update! i (values i)))

(println (range-sum 1 3))
(fen-update! 1 4)
(println (range-sum 1 3))
