(ns star_numbers)

;; 6n(n-1)+1
(defn term [n]
  (((6 * n) * (n - 1)) + 1))

(doseq [n (range 1 16)]
  (println n "->" (term n)))
