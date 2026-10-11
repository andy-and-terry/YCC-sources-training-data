(defn gray [n] (bit-xor n (bit-shift-right n 1)))

(doseq [i (range 8)]
  (println i (Long/toBinaryString (gray i))))
