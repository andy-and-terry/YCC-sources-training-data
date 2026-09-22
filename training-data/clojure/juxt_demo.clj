(def stats (juxt (partial apply min) (partial apply max) (comp #(/ % 1.0) count)))

(println (stats [4 8 15 16 23 42]))

(def people [{:name "Alice" :age 30} {:name "Bob" :age 25} {:name "Carol" :age 30}])

(println "grouped by age:" (group-by :age people))
(println "partitioned by age 30:" (partition-by #(= 30 (:age %))
                                                  (sort-by :age people)))

(def name-and-age (juxt :name :age))
(println (map name-and-age people))
