;; Detects a cycle in a directed graph via DFS with three-coloring: a
;; :gray node is still on the current path, so reaching one again means
;; a back edge (a cycle); a :black node has already finished safely.
(defn has-cycle? [graph nodes]
  (let [color (atom (zipmap nodes (repeat :white)))]
    (letfn [(visit [node]
              (swap! color assoc node :gray)
              (let [result (some (fn [neighbor]
                                    (case (get @color neighbor)
                                      :gray true
                                      :white (visit neighbor)
                                      false))
                                  (get graph node []))]
                (swap! color assoc node :black)
                result))]
      (boolean (some (fn [n] (when (= (get @color n) :white) (visit n))) nodes)))))

(def cyclic-graph {0 [1] 1 [2] 2 [3] 3 [1]})
(def acyclic-graph {0 [1] 1 [2] 2 [3] 3 []})

(println (has-cycle? cyclic-graph (keys cyclic-graph)))
(println (has-cycle? acyclic-graph (keys acyclic-graph)))
