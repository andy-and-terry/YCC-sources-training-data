(ns centered_hexagonal_numbers)

;; 3n(n-1)+1
(defn term [n]
  (((3 * n) * (n - 1)) + 1))

(doseq [n (range 1 16)]
  (println n "->" (term n)))
