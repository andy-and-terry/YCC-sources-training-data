(ns octahedral_numbers)

;; n(2n^2+1)/3
(defn term [n]
  (quot (n * (((2 * n) * n) + 1)) 3))

(doseq [n (range 1 16)]
  (println n "->" (term n)))
