(def people [{:name "Carol" :age 35}
             {:name "Alice" :age 30}
             {:name "Bob" :age 30}])

(println "by age:" (sort-by :age people))
(println "by age desc:" (sort-by :age > people))
(println "by age then name:" (sort-by (juxt :age :name) people))
