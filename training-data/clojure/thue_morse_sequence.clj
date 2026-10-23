;; Thue-Morse: t(n) is the parity of the number of 1 bits in n
(println (apply str (map #(mod (Long/bitCount %) 2) (range 32))))
