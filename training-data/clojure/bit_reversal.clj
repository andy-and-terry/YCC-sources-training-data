(defn reverse-bits [v]
  (reduce (fn [acc i] (bit-or (bit-shift-left acc 1) (bit-and (bit-shift-right v i) 1)))
          0
          (range 8)))

(doseq [v [1 6 13 128]]
  (println v (reverse-bits v))) ; 128 96 176 1
