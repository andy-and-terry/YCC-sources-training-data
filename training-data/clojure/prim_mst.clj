(defn prim-mst [n adj start]
  (loop [visited #{start}
         mst-edges []
         frontier (sort-by last (adj start))]
    (if (or (empty? frontier) (= (count visited) n))
      mst-edges
      (let [[u v w] (first frontier)
            rest-frontier (rest frontier)]
        (if (visited v)
          (recur visited mst-edges rest-frontier)
          (recur (conj visited v)
                 (conj mst-edges [u v w])
                 (sort-by last (concat rest-frontier (adj v)))))))))

(def graph
  {0 [[0 1 2] [0 3 6]]
   1 [[1 0 2] [1 2 3] [1 3 8] [1 4 5]]
   2 [[2 1 3] [2 4 7]]
   3 [[3 0 6] [3 1 8] [3 4 9]]
   4 [[4 1 5] [4 2 7] [4 3 9]]})

(println (prim-mst 5 graph 0))
