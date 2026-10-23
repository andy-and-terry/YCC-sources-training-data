(def xf
  (comp (filter odd?)
        (map #(* % %))
        (take 4)))

(println (into [] xf (range 20)))
(println (transduce xf + 0 (range 20)))
(println (sequence xf (range 20)))
