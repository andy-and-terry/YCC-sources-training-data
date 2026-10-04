(def xs (range 1 11))

;; fixed-size chunks, dropping the incomplete tail
(println (partition 3 xs))

;; keep the tail
(println (partition-all 3 xs))

;; sliding window (step 1)
(println (partition 3 1 xs))

;; pad the final chunk
(println (partition 4 4 [:pad :pad] xs))

;; split whenever the function value changes
(println (partition-by even? [2 4 1 3 5 6 8 7]))

;; consecutive runs of equal letters
(println (map (juxt first count) (partition-by identity "aaabccdddd")))

;; split-with and split-at
(println (split-at 4 xs))
(println (split-with #(< % 5) xs))

;; moving average
(println (map #(/ (reduce + %) 3.0) (partition 3 1 [1 2 3 4 5 6])))
