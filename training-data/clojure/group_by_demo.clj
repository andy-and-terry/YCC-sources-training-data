(def people [{:name "Ada" :dept "eng"} {:name "Bob" :dept "sales"} {:name "Cleo" :dept "eng"}])

(println (group-by :dept people))
(println (map :name (get (group-by :dept people) "eng")))
