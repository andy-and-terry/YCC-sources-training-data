(def xs (range 1 11))

(println (partition 3 xs))                ; drops the incomplete tail
(println (partition-all 3 xs))            ; keeps it
(println (partition 3 1 (range 1 6)))     ; sliding window, step 1
(println (partition 2 2 [:pad] (range 5)))
(println (partition-by even? [2 4 1 3 6 8 5]))
(println (split-at 4 xs))
(println (split-with #(< % 4) xs))
