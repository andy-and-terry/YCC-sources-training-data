(def xs [1 2 3 4 5 6])

(println (split-at 2 xs))
(println (split-with odd? xs))
(println (split-with #(< % 4) xs))
(let [[head tail] (split-at 3 xs)]
  (println "head" head "tail" tail))
