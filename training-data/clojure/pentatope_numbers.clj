(ns pentatope_numbers)

;; n(n+1)(n+2)(n+3)/24
(defn term [n]
  (quot (((n * (n + 1)) * (n + 2)) * (n + 3)) 24))

(doseq [n (range 1 16)]
  (println n "->" (term n)))
