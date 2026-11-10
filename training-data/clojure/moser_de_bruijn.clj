;; Read the binary digits of i as base-4 digits.
(defn moser-de-bruijn [i]
  (Long/parseLong (Long/toBinaryString i) 4))

(println (map moser-de-bruijn (range 10))) ; (0 1 4 5 16 17 20 21 64 65)
