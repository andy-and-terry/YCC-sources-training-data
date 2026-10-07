(defn matrix-chain-order [dims]
  (let [n (dec (count dims))
        dp (atom (vec (repeat (inc n) (vec (repeat (inc n) 0)))))]
    (doseq [len (range 2 (inc n))]
      (doseq [i (range 1 (inc (- n len -1)))]
        (let [j (+ i len -1)]
          (when (<= j n)
            (let [costs (for [k (range i j)]
                          (+ (get-in @dp [i k])
                             (get-in @dp [(inc k) j])
                             (* (nth dims (dec i)) (nth dims k) (nth dims j))))]
              (swap! dp assoc-in [i j] (apply min costs)))))))
    (get-in @dp [1 n])))

;; Matrices: 40x20, 20x30, 30x10, 10x30 -> dims = [40 20 30 10 30]
(println (matrix-chain-order [40 20 30 10 30]))
