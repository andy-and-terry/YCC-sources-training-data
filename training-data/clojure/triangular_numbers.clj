(def triangulars (reductions + (iterate inc 1)))

(println (take 10 triangulars))
(println (first (filter #(> % 1000) triangulars)))
(println (nth triangulars 99))
