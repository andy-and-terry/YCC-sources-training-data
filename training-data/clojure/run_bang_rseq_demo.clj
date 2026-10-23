;; run! for side effects, rseq for cheap reverse, and not-empty as a guard

;; run! applies a function to each item purely for side effects (returns nil)
(run! println ["alpha" "beta" "gamma"])

;; rseq reverses vectors and sorted collections in O(1)
(def v [1 2 3 4 5])
(println "reversed vector:" (rseq v))
(println "last two, reversed:" (take 2 (rseq v)))

(def scores (sorted-map "ann" 91 "bob" 78 "cy" 85))
(println "highest key first:" (first (rseq scores)))

;; rseq on an empty collection returns nil
(println "rseq of []:" (rseq []))

;; not-empty returns nil for empty collections, handy with or / if-let
(defn describe [coll]
  (if-let [xs (not-empty coll)]
    (str "has " (count xs) " items, first is " (first xs))
    "empty"))

(println (describe [10 20 30]))
(println (describe []))
(println (describe ""))
(println "default:" (or (not-empty []) [:fallback]))
