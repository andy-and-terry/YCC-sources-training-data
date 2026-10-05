(def words ["apple" "pear" "apple" "fig" "pear" "apple"])

(def freq (frequencies words))
(println freq)

(println (sort-by val > freq))
(println (key (apply max-key val freq)))
(println (frequencies "mississippi"))
(println (group-by count words))
