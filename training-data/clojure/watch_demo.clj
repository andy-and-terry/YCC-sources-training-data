(def counter (atom 0))

(add-watch counter :logger
           (fn [key ref old-val new-val]
             (println (str "[" key "] changed from " old-val " to " new-val))))

(swap! counter inc)
(swap! counter + 5)
(reset! counter 0)

(remove-watch counter :logger)
(swap! counter inc)
(println "final value:" @counter)
