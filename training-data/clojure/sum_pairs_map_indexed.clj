(def xs [10 20 30 40])

(println (map-indexed vector xs))
(println (map-indexed (fn [i x] (* i x)) xs))
(println (into {} (map-indexed (fn [i x] [x i]) xs)))
