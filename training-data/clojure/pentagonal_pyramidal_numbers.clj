(ns pentagonal_pyramidal_numbers)

;; n^2(n+1)/2
(defn term [n]
  (quot ((n * n) * (n + 1)) 2))

(doseq [n (range 1 16)]
  (println n "->" (term n)))
