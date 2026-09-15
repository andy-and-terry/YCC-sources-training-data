(defn- bfs-color [graph colors start]
  (loop [colors (assoc colors start 0)
         queue [start]]
    (if (empty? queue)
      colors
      (let [node (first queue)
            node-color (colors node)
            neighbors (get graph node [])
            conflict (some #(= (colors %) node-color) neighbors)]
        (if conflict
          nil
          (let [new-nodes (remove #(contains? colors %) neighbors)
                colors (reduce #(assoc %1 %2 (- 1 node-color)) colors new-nodes)]
            (recur colors (into (vec (rest queue)) new-nodes))))))))

(defn bipartite? [graph nodes]
  (loop [colors {}
         remaining nodes]
    (cond
      (empty? remaining) true
      (contains? colors (first remaining)) (recur colors (rest remaining))
      :else (let [colors (bfs-color graph colors (first remaining))]
              (if (nil? colors)
                false
                (recur colors (rest remaining)))))))

(def graph-ok {0 [1 3] 1 [0 2] 2 [1 3] 3 [0 2]})
(def graph-bad {0 [1 2] 1 [0 2] 2 [0 1]})

(println (bipartite? graph-ok (keys graph-ok)))
(println (bipartite? graph-bad (keys graph-bad)))
