;; Square of the sum minus sum of squares for 1..10 (expect 2640)
(let [xs (range 1 11)
      sum (reduce + xs)
      squares (reduce + (map #(* % %) xs))]
  (println (- (* sum sum) squares)))
