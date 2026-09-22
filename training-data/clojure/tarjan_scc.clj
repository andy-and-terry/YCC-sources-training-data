(defn tarjan-scc [graph node-count]
  (let [disc (atom (vec (repeat node-count -1)))
        low (atom (vec (repeat node-count -1)))
        on-stack (atom (vec (repeat node-count false)))
        stack (atom [])
        counter (atom 0)
        sccs (atom [])]
    (letfn [(dfs [u]
              (swap! disc assoc u @counter)
              (swap! low assoc u @counter)
              (swap! counter inc)
              (swap! stack conj u)
              (swap! on-stack assoc u true)
              (doseq [v (get graph u [])]
                (cond
                  (= -1 (@disc v))
                  (do (dfs v)
                      (swap! low assoc u (min (@low u) (@low v))))
                  (@on-stack v)
                  (swap! low assoc u (min (@low u) (@disc v)))))
              (when (= (@disc u) (@low u))
                (loop [component []]
                  (let [w (peek @stack)]
                    (swap! stack pop)
                    (swap! on-stack assoc w false)
                    (let [component (conj component w)]
                      (if (= w u)
                        (swap! sccs conj component)
                        (recur component)))))))]
      (doseq [i (range node-count)]
        (when (= -1 (@disc i))
          (dfs i))))
    @sccs))

(println (tarjan-scc {0 [1] 1 [2] 2 [0 3] 3 [4] 4 [3] 5 [6] 6 [7] 7 []} 8))
