(println (take 8 (iterate #(* 2 %) 1)))
(def fibs (lazy-cat [0 1] (map + fibs (rest fibs))))
(println (take 10 fibs))
