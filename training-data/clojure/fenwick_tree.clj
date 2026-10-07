(defn make-fenwick [n]
  (atom (vec (repeat (inc n) 0))))

(defn fenwick-update! [tree i delta n]
  (loop [i i]
    (when (<= i n)
      (swap! tree update i + delta)
      (recur (+ i (bit-and i (- i)))))))

(defn fenwick-prefix-sum [tree i]
  (loop [i i sum 0]
    (if (<= i 0)
      sum
      (recur (- i (bit-and i (- i))) (+ sum (@tree i))))))

(defn fenwick-range-sum [tree lo hi]
  (- (fenwick-prefix-sum tree hi) (fenwick-prefix-sum tree (dec lo))))

(def n 8)
(def values [3 2 -1 6 5 4 -3 3])
(def tree (make-fenwick n))

(doseq [i (range n)]
  (fenwick-update! tree (inc i) (values i) n))

(println "prefix sum through index 4 (1-based):" (fenwick-prefix-sum tree 4))
(println "range sum [3,6] (1-based):" (fenwick-range-sum tree 3 6))
