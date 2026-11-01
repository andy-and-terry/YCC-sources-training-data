(def users [{:name "ann" :age 30} {:name "bob" :age 17} {:name "cy" :age 45}])

(->> users
     (filter #(>= (:age %) 18))
     (map :name)
     (map clojure.string/upper-case)
     (println))

(-> {:a 1} (assoc :b 2) (update :a inc) println)
