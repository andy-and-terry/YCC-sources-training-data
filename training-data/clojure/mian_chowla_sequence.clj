;; Greedy sequence whose pairwise sums are all distinct.
(defn mian-chowla [limit]
  (loop [cand 1, seq [], sums #{}]
    (if (= (count seq) limit)
      seq
      (let [fresh (map #(+ % cand) (conj seq cand))]
        (if (and (= (count fresh) (count (set fresh)))
                 (not-any? sums fresh))
          (recur (inc cand) (conj seq cand) (into sums fresh))
          (recur (inc cand) seq sums))))))

(println (clojure.string/join " " (mian-chowla 8)))
