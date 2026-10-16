(def people [{:name "Zoe" :age 30}
             {:name "Adam" :age 25}
             {:name "Bea" :age 30}
             {:name "Carl" :age 25}])

(println (map :name (sort-by (juxt :age :name) people)))
(println (map :name (sort-by (juxt (comp - :age) :name) people)))
(println (map :name (sort-by :name #(compare %2 %1) people)))
