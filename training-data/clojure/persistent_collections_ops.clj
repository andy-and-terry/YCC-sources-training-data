(let [v [1 2 3]
      m {:a 1 :b 2}
      s #{1 2 3}
      l '(1 2 3)]
  (println (conj v 4) (conj l 0) (conj s 9))
  (println (assoc v 1 :x) (get m :c :none) (m :a) (:b m))
  (println (merge m {:b 3 :c 4}) (merge-with + m {:a 10}))
  (println (select-keys m [:a]) (keys m) (vals m) (zipmap [:x :y] [1 2]))
  (println (disj s 1) (contains? s 2) (clojure.set/union s #{7}))
  (println (peek v) (pop v) (subvec v 1) (first l) (rest l) (nth v 2))
  (println (update-in {:a {:b 1}} [:a :b] + 10) (assoc-in {} [:x :y] 1) (get-in m [:a])))
