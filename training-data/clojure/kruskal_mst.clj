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
  (let [ra (uf-find uf a)
        rb (uf-find uf b)]
    (when (not= ra rb)
      (swap! uf assoc ra rb)
      true)))

(defn kruskal [n edges]
  (let [uf (make-uf n)
        sorted-edges (sort-by #(nth % 2) edges)]
    (reduce
     (fn [mst [u v w]]
       (if (uf-union! uf u v)
         (conj mst [u v w])
         mst))
     []
     sorted-edges)))

(def edges [[0 1 10] [0 2 6] [0 3 5] [1 3 15] [2 3 4]])

(println (kruskal 4 edges))
