;; Fibbinary numbers: no two adjacent 1 bits.
(println (clojure.string/join " "
           (filter #(zero? (bit-and % (bit-shift-right % 1))) (range 50))))
