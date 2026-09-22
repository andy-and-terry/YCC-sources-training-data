(import 'java.util.PriorityQueue)

;; Keep only the k smallest numbers seen so far, using a max-heap
;; (via a reversed comparator) capped at size k.
(defn top-k-smallest [nums k]
  (let [pq (PriorityQueue. (fn [a b] (compare b a)))]
    (doseq [n nums]
      (.offer pq n)
      (when (> (.size pq) k)
        (.poll pq)))
    (sort (into [] pq))))

(println (top-k-smallest [7 2 9 4 1 8 3] 3))
