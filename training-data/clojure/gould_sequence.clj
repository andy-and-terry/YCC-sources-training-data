(defn gould [n] (bit-shift-left 1 (Long/bitCount n)))

(println (map gould (range 16)))
