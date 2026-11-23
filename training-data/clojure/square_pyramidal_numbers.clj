(ns square_pyramidal_numbers)

;; n(n+1)(2n+1)/6
(defn term [n]
  (quot ((n * (n + 1)) * ((2 * n) + 1)) 6))

(doseq [n (range 1 16)]
  (println n "->" (term n)))
