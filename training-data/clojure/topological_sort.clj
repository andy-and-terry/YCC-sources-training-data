(defn topo-sort [graph node-count]
  (let [in-degree (reduce (fn [acc [_ neighbors]]
                             (reduce #(update %1 %2 (fnil inc 0)) acc neighbors))
                           (zipmap (range node-count) (repeat 0))
                           graph)]
    (loop [queue (into [] (filter #(zero? (in-degree %)) (range node-count)))
           in-degree in-degree
           result []]
      (if (empty? queue)
        result
        (let [node (first queue)
              neighbors (get graph node [])
              [new-queue new-in-degree]
              (reduce (fn [[q d] n]
                        (let [d (update d n dec)]
                          (if (zero? (d n)) [(conj q n) d] [q d])))
                      [(vec (rest queue)) in-degree]
                      neighbors)]
          (recur new-queue new-in-degree (conj result node)))))))

(println (topo-sort {0 [1 2] 1 [3] 2 [3] 3 []} 4))
