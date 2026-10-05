(def tree
  {:name "root"
   :children [{:name "a" :children [{:name "a1" :children []}
                                    {:name "a2" :children []}]}
              {:name "b" :children []}]})

(def nodes (tree-seq :children :children tree))

(println (map :name nodes))
(println (count nodes))
(println (map :name (filter #(empty? (:children %)) nodes)))

(println (flatten [1 [2 [3 [4]] 5]]))
(println (filter number? (tree-seq coll? seq [1 [2 :x [3]] "s"])))
