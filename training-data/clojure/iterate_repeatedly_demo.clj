(println "powers of two:" (take 6 (iterate #(* 2 %) 1)))

(println "repeat 4 :x" (repeat 4 :x))

(println "cycle rgb:" (take 7 (cycle [:red :green :blue])))

(def counter (atom 0))
(println "repeatedly:" (repeatedly 5 #(swap! counter inc)))
