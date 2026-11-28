(def data [{:k :a :v 1} {:k :b :v 2} {:k :a :v 3}])
(println (reduce-kv (fn [m k vs] (assoc m k (reduce + (map :v vs))))
                    {} (group-by :k data)))
