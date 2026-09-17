(def inf 999999)

(defn floyd-warshall [dist n]
  (reduce
   (fn [d k]
     (reduce
      (fn [d i]
        (reduce
         (fn [d j]
           (let [through-k (+ (get-in d [i k]) (get-in d [k j]))]
             (if (< through-k (get-in d [i j]))
               (assoc-in d [i j] through-k)
               d)))
         d
         (range n)))
      d
      (range n)))
   dist
   (range n)))

(def graph
  [[0 5 inf 10]
   [inf 0 3 inf]
   [inf inf 0 1]
   [inf inf inf 0]])

(println (floyd-warshall graph 4))
