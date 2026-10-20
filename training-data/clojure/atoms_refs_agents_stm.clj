(def counter (atom 0))
(dotimes [_ 5] (swap! counter inc))
(println @counter (compare-and-set! counter 5 100) @counter (reset! counter 0))

(def a (ref 100))
(def b (ref 0))
(dosync (alter a - 30) (alter b + 30))
(println @a @b)

(def ag (agent 0))
(send ag + 10)
(await ag)
(println @ag)

(def cache (atom {}))
(swap! cache assoc :k 1)
(swap! cache update :k + 5)
(add-watch cache :w (fn [_ _ old new] (println "changed" old "->" new)))
(swap! cache assoc :z 0)
