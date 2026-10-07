(def tree {:name "root"
           :children [{:name "a" :children [{:name "a1" :children []}]}
                      {:name "b" :children []}]})

(println (map :name (tree-seq (comp seq :children) :children tree)))

;; flatten arbitrary nested vectors, collecting leaves
(println (filter (complement sequential?)
                 (rest (tree-seq sequential? seq [1 [2 [3 4]] [[5]] 6]))))
(println (flatten [1 [2 [3 [4]]]]))
