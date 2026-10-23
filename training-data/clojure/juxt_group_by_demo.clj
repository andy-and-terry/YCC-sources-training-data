(def words ["apple" "avocado" "banana" "blueberry" "cherry" "apricot"])

(println ((juxt first count) "clojure"))
(println (map (juxt identity count) ["a" "bb" "ccc"]))
(println (group-by first words))
(println (update-vals (group-by first words) count))
(println (sort-by (juxt count identity) words))
