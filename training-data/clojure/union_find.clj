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
      (swap! uf assoc ra rb))))

(def uf (make-uf 6))
(uf-union! uf 0 1)
(uf-union! uf 1 2)
(println (= (uf-find uf 0) (uf-find uf 2)))
(println (= (uf-find uf 0) (uf-find uf 5)))
