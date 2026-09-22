(defn dijkstra [graph start]
  (loop [dist {start 0}
         visited #{}
         pq (sorted-set [0 start])]
    (if (empty? pq)
      dist
      (let [[d u] (first pq)
            pq (disj pq [d u])]
        (if (visited u)
          (recur dist visited pq)
          (let [visited (conj visited u)
                [dist pq]
                (reduce (fn [[dist pq] [v w]]
                          (let [nd (+ d w)]
                            (if (< nd (get dist v Integer/MAX_VALUE))
                              [(assoc dist v nd) (conj pq [nd v])]
                              [dist pq])))
                        [dist pq]
                        (get graph u []))]
            (recur dist visited pq)))))))

(def graph
  {:a [[:b 4] [:c 1]]
   :b [[:d 1]]
   :c [[:b 2] [:d 5]]
   :d []})

(println (dijkstra graph :a))
