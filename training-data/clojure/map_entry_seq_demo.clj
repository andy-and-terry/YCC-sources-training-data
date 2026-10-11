(def m {:a 1 :b 2 :c 3})

(doseq [[k v] m] (println k "->" v))
(println (map key m) (map val m))
(println (keys m) (vals m))
(println (first m) (type (first m)))
(println (into {} (map (fn [[k v]] [k (* v 10)]) m)))
