(def counter (atom 0))
(dotimes [_ 5] (swap! counter inc))
(println @counter)
(println (compare-and-set! counter 5 100) @counter)
