(ns tetrahedral_numbers)

;; n(n+1)(n+2)/6
(defn term [n]
  (quot ((n * (n + 1)) * (n + 2)) 6))

(doseq [n (range 1 16)]
  (println n "->" (term n)))
