(def xf (comp (filter odd?) (map #(* 3 %))))
(println (into [] xf (range 10)))
(println (transduce xf + (range 10)))
