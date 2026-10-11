(def words ["apple" "fig" "banana" "kiwi"])

(println (apply max-key count words))
(println (apply min-key count words))
(def scores {:a 3 :b 9 :c 5})
(println (apply max-key val scores))
(println (key (apply min-key val scores)))
