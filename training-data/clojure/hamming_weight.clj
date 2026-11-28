(defn popcount [n]
  (loop [n n c 0]
    (if (zero? n) c (recur (bit-and n (dec n)) (inc c)))))

(println (popcount 2r10110111) (Long/bitCount 2r10110111))
