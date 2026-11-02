(def xf (comp (filter odd?) (map #(* % %)) (take 4)))
(println (into [] xf (range 20)))
