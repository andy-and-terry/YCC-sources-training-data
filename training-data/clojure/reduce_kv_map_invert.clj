(defn invert [m]
  (reduce-kv (fn [acc k v] (assoc acc v k)) {} m))
(println (invert {:a 1 :b 2 :c 3}))
