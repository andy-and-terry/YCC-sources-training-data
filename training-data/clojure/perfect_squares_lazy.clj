(def squares (map #(* % %) (iterate inc 1)))

(println (take 10 squares))
(println (take-while #(< % 200) squares))
(println (first (filter #(> % 5000) squares)))
