;; peek and pop act on the efficient end of each collection.

;; Vector: end of the vector
(let [v [1 2 3]]
  (println "vector peek:" (peek v) "pop:" (pop v)))

;; List: front of the list
(let [l '(1 2 3)]
  (println "list peek:" (peek l) "pop:" (pop l)))

;; Queue: conj adds at the back, peek/pop work at the front
(let [q (-> clojure.lang.PersistentQueue/EMPTY
            (conj :a)
            (conj :b)
            (conj :c))]
  (println "queue peek:" (peek q))
  (println "after pop:" (seq (pop q))))

;; peek on an empty collection is nil, but pop throws
(println "empty peek:" (peek []))
(println (try (pop []) (catch IllegalStateException e "pop of empty vector throws")))
