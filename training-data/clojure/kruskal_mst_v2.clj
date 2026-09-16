(defn make-uf [n]
  (atom (vec (range n))))

(defn uf-find [uf x]
  (let [parent (@uf x)]
    (if (= parent x)
      x
      (let [root (uf-find uf parent)]
        (swap! uf assoc x root)
        root))))

(defn uf-union! [uf a b]
  (swap! uf assoc (uf-find uf a) (uf-find uf b)))

(defn kruskal [n edges]
  (let [uf (make-uf n)
        sorted (sort-by #(nth % 2) edges)]
    (reduce (fn [mst [u v w]]
              (let [ru (uf-find uf u)
                    rv (uf-find uf v)]
                (if (= ru rv)
                  mst
                  (do (uf-union! uf ru rv)
                      (conj mst [u v w])))))
            []
            sorted)))

(def edges [[0 1 1] [0 2 3] [1 2 4] [1 3 2] [2 3 5]])
(println (kruskal 4 edges))
