(def graph
  {:a {:b 4 :c 1}
   :b {:d 1}
   :c {:b 2 :d 5}
   :d {}})

(defn dijkstra [graph start]
  (loop [dist {start 0}
         unvisited (set (keys graph))]
    (if (empty? unvisited)
      dist
      (let [current (apply min-key #(get dist % Integer/MAX_VALUE) unvisited)
            current-dist (get dist current Integer/MAX_VALUE)]
        (if (= current-dist Integer/MAX_VALUE)
          dist
          (let [updated (reduce
                          (fn [d [neighbor weight]]
                            (let [candidate (+ current-dist weight)]
                              (if (< candidate (get d neighbor Integer/MAX_VALUE))
                                (assoc d neighbor candidate)
                                d)))
                          dist
                          (get graph current))]
            (recur updated (disj unvisited current))))))))

(println (dijkstra graph :a))
