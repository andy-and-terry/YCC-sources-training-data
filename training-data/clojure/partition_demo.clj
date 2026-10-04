(def xs (range 1 11))

(println (partition 3 xs))
(println (partition-all 3 xs))
(println (partition 3 2 xs))
(println (partition 3 3 [:pad] xs))
(println (partition-by #(< % 5) xs))
(println (split-at 4 xs))
(println (split-with even? [2 4 5 6]))
