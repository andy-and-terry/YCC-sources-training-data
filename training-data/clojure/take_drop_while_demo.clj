(def xs [1 2 3 8 9 2 1])

(println (take-while #(< % 5) xs))
(println (drop-while #(< % 5) xs))
(println (take-last 2 xs))
(println (drop-last 2 xs))
(println (take-nth 3 xs))
(println (butlast xs))
(println (rest xs) (next [1]) (rest [1]))

;; trim leading and trailing zeros
(defn trim-zeros [coll]
  (->> coll
       (drop-while zero?)
       reverse
       (drop-while zero?)
       reverse))
(println (trim-zeros [0 0 3 0 4 0 0]))

;; read tokens until a delimiter
(let [[head tail] (split-with #(not= % :end) [:a :b :end :c])]
  (println head (rest tail)))

;; lazy infinite sources
(println (take-while #(< % 50) (map #(* % %) (iterate inc 1))))
(println (first (drop-while #(< % 1000) (iterate #(* 2 %) 1))))
(println (rseq [1 2 3]))
(println (subvec [10 20 30 40 50] 1 4))
