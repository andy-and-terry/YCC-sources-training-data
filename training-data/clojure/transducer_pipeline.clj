(def xf (comp (filter odd?) (map #(* 3 %)) (take 4)))
(println (into [] xf (range 20)))
(println (transduce xf + (range 20)))
