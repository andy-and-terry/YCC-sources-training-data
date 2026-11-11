;; Population count (number of set bits) for 0..15
(defn bits [n] (Long/bitCount n))

(println (map bits (range 16)))
