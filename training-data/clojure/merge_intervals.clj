(defn merge-intervals [intervals]
  (let [sorted (sort-by first intervals)]
    (reduce
     (fn [merged interval]
       (if (empty? merged)
         [interval]
         (let [[start end] (peek merged)
               [s e] interval]
           (if (<= s end)
             (conj (pop merged) [start (max end e)])
             (conj merged interval)))))
     []
     sorted)))

(println (merge-intervals [[1 3] [2 6] [8 10] [15 18]]))
(println (merge-intervals [[1 4] [4 5]]))
