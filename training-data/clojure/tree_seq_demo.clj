(def tree
  {:name "root"
   :children [{:name "docs"
               :children [{:name "a.txt" :children []}
                          {:name "b.txt" :children []}]}
              {:name "src"
               :children [{:name "core.clj" :children []}
                          {:name "util"
                           :children [{:name "str.clj" :children []}]}]}]})

;; depth-first walk of all nodes
(def nodes (tree-seq (comp seq :children) :children tree))
(println (map :name nodes))

;; only the leaves
(println (map :name (filter (comp empty? :children) nodes)))

;; count nodes
(println (count nodes))

;; flatten a nested vector with tree-seq
(def nested [1 [2 [3 4]] [[5]] 6])
(println (remove sequential? (tree-seq sequential? seq nested)))

;; the same data with clojure.core/flatten
(println (flatten nested))
