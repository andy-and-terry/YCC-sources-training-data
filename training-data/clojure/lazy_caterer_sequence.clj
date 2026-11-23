(ns lazy_caterer_sequence)

;; n(n+1)/2+1
(defn term [n]
  ((quot (n * (n + 1)) 2) + 1))

(doseq [n (range 1 16)]
  (println n "->" (term n)))
