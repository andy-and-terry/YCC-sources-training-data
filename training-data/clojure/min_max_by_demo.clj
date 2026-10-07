(def words ["pear" "fig" "banana" "kiwi" "apple"])

(println (apply min-key count words))
(println (apply max-key count words))
(println (sort-by count words))
(println (sort-by (juxt count identity) words))
(println (reduce (fn [a b] (if (neg? (compare a b)) a b)) words))
(println (apply max [3 9 2]) (apply min [3 9 2]))
(println (reduce max Long/MIN_VALUE []))
