(defn heap-sort [coll]
  (loop [heap (into (sorted-set) coll)
         result []]
    (if (empty? heap)
      result
      (recur (disj heap (first heap)) (conj result (first heap))))))

(println (heap-sort [5 3 8 1 9 2]))
