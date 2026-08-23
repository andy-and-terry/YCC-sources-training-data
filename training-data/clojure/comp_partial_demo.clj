(def add-one (partial + 1))
(def double-it (partial * 2))
(def add-one-then-double (comp double-it add-one))

(println (add-one-then-double 3))
(println (map add-one [1 2 3]))
