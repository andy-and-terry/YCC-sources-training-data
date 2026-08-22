(def counter (atom 0))

(defn increment! []
  (swap! counter inc))

(dotimes [_ 5]
  (increment!))

(println @counter)
