(defn sieve [limit]
  (let [is-prime (boolean-array (inc limit) true)]
    (aset is-prime 0 false)
    (aset is-prime 1 false)
    (doseq [n (range 2 (inc (int (Math/sqrt limit))))]
      (when (aget is-prime n)
        (doseq [m (range (* n n) (inc limit) n)]
          (aset is-prime m false))))
    (filter #(aget is-prime %) (range (inc limit)))))

(println (sieve 50))
