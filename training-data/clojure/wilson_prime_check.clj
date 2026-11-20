;; Wilson's theorem primality test.
(defn wilson? [n]
  (and (>= n 2) (= (reduce (fn [f i] (mod (* f i) n)) 1 (range 2 n)) (dec n))))
(println (filter wilson? (range 2 20)))
