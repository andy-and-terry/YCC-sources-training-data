(def xf (comp (filter even?) (map #(* % %)) (take 3)))

(println (into [] xf (range 20)))
(println (transduce xf + (range 20)))
