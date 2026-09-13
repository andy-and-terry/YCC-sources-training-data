(def scores (sorted-map "bob" 82 "alice" 91 "carol" 76))

(def unique-numbers (sorted-set 5 1 9 1 3 5))

(println scores)
(println unique-numbers)
(println (first scores))
(println (rsubseq unique-numbers > 3))
