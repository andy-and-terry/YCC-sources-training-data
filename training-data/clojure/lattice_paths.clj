;; Lattice paths with iterate over DP rows.
(defn lattice [n]
  (last (nth (iterate #(reductions + %) (repeat (inc n) 1)) n)))
(println (lattice 3))
