(def xs (range 1 11))

(println (partition 3 xs))
(println (partition-all 3 xs))
(println (partition 3 1 (range 1 6)))
(println (partition-by odd? [1 3 5 2 4 7 9]))
(println (split-at 4 xs))
(println (split-with #(< % 4) xs))
(println (partition 2 2 [:pad] (range 1 6)))
