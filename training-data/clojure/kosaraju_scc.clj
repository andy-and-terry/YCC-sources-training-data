(defn- dfs-order [graph node visited order]
  (when-not (contains? @visited node)
    (swap! visited conj node)
    (doseq [w (get graph node [])]
      (dfs-order graph w visited order))
    (swap! order conj node)))

(defn- transpose [graph]
  (reduce (fn [acc [u neighbors]]
            (reduce (fn [acc2 v] (update acc2 v conj u)) acc neighbors))
          {}
          graph))

(defn- dfs-collect [graph node visited component]
  (when-not (contains? @visited node)
    (swap! visited conj node)
    (swap! component conj node)
    (doseq [w (get graph node [])]
      (dfs-collect graph w visited component))))

;; Kosaraju's algorithm: one DFS pass records finish order, then a second
;; DFS pass over the transposed graph, visited in reverse finish order,
;; peels off one strongly connected component per top-level call.
(defn kosaraju-scc [graph]
  (let [visited (atom #{})
        order (atom [])]
    (doseq [v (keys graph)]
      (when-not (contains? @visited v)
        (dfs-order graph v visited order)))
    (let [rev-graph (transpose graph)
          visited2 (atom #{})
          result (atom [])]
      (doseq [v (reverse @order)]
        (when-not (contains? @visited2 v)
          (let [component (atom [])]
            (dfs-collect rev-graph v visited2 component)
            (swap! result conj @component))))
      @result)))

(def graph {0 [1] 1 [2] 2 [0 3] 3 [4] 4 [5] 5 [3] 6 [5 7] 7 []})

(println (kosaraju-scc graph))
