(defn coin-change [coins amount]
  (let [dp (long-array (inc amount) (inc amount))]
    (aset dp 0 0)
    (doseq [a (range 1 (inc amount))]
      (doseq [c coins :when (<= c a)]
        (aset dp a (min (aget dp a) (inc (aget dp (- a c)))))))
    (if (> (aget dp amount) amount) -1 (aget dp amount))))

(println (coin-change [1 2 5] 11))
