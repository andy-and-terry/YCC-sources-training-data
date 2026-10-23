(def xs [1 1 2 2 2 3 1 1])

(println (partition-by identity xs))
(println (map (juxt first count) (partition-by identity xs)))
(println (split-with odd? [1 3 5 6 7 9]))
(println (partition-all 3 (range 8)))
(println (partition 3 1 (range 6)))
(println (partition-by neg? [1 2 -1 -2 3]))
