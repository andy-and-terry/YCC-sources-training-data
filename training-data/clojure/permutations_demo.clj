(defn permutations [coll]
  (if (empty? coll)
    [[]]
    (for [x coll
          rest-perm (permutations (remove #(= % x) coll))]
      (cons x rest-perm))))

(doseq [p (permutations [1 2 3])]
  (println p))
