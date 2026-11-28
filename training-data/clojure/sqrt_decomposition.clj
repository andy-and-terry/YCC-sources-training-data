(let [a [5 3 8 1 9 2 7 4 6 0 3 5]
      bs 4
      blocks (mapv #(reduce + %) (partition-all bs a))
      query (fn [l r]
              (loop [i l s 0]
                (cond (> i r) s
                      (and (zero? (mod i bs)) (<= (+ i bs -1) r))
                      (recur (+ i bs) (+ s (blocks (quot i bs))))
                      :else (recur (inc i) (+ s (a i))))))]
  (println (query 2 9)))
