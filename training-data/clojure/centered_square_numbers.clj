(ns centered_square_numbers)

;; 2n(n-1)+1
(defn term [n]
  (((2 * n) * (n - 1)) + 1))

(doseq [n (range 1 16)]
  (println n "->" (term n)))
