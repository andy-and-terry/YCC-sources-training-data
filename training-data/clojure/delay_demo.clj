(def expensive
  (delay
    (println "computing...")
    (Thread/sleep 10)
    (* 6 7)))

(println "created, forced?" (realized? expensive))
(println "first deref:" @expensive)
(println "second deref:" @expensive)
(println "still forced?" (realized? expensive))
