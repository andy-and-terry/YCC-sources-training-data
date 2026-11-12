(def m {:a 1 :b 2 :c 3})
(println (reduce-kv (fn [acc k v] (assoc acc (name k) (* v 10))) {} m))
(println (into {} (filter (fn [[_ v]] (odd? v)) m)))
