(def stats (juxt count (partial apply min) (partial apply max) (partial apply +)))

(println (stats [4 2 9 1 7]))

(def people [{:name "Ada" :age 36} {:name "Bob" :age 42} {:name "Cy" :age 29}])
(def name-and-age (juxt :name :age))

(println (map name-and-age people))

(def min-max-by-age ((juxt (partial apply min-key :age) (partial apply max-key :age)) people))
(println min-max-by-age)
