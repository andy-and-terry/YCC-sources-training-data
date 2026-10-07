(defn hamming-bits [a b]
  (Long/bitCount (bit-xor a b)))

(defn hamming-str [a b]
  (when (= (count a) (count b))
    (count (filter true? (map not= a b)))))

(println (hamming-bits 1 4))
(println (hamming-bits 255 0))
(println (hamming-str "karolin" "kathrin"))
(println (hamming-str "abc" "ab"))
