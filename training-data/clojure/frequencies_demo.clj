(def words ["apple" "pear" "apple" "fig" "pear" "apple"])

(def freq (frequencies words))
(println freq)

;; most common first
(println (sort-by (comp - val) freq))
(println (key (apply max-key val freq)))

;; frequencies work on any seqable, e.g. characters
(println (frequencies "mississippi"))
