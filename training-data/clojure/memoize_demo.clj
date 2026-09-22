(def call-count (atom 0))

(defn slow-square [n]
  (swap! call-count inc)
  (* n n))

(def fast-square (memoize slow-square))

(println (fast-square 5))
(println (fast-square 5))
(println (fast-square 6))
(println @call-count)
