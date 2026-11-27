(defn fletcher16 [^String s]
  (let [[s1 s2] (reduce (fn [[a b] c]
                          (let [a' (mod (+ a (int c)) 255)]
                            [a' (mod (+ b a') 255)]))
                        [0 0] s)]
    (bit-or (bit-shift-left s2 8) s1)))

(println (format "%x" (fletcher16 "abcde")))
