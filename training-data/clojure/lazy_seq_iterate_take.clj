(def pow2 (iterate #(* 2 %) 1))
(println (take 10 pow2))
(println (take-while #(< % 100) pow2))
