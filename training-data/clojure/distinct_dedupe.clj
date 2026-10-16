(def xs [1 1 2 2 2 3 1 1])

(println (distinct xs))
(println (dedupe xs))
(println (sort (set xs)))
(println (map first (partition-by identity xs)))
