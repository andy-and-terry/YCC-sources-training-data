(def state {:user {:name "Ada" :visits 3 :tags ["math"]}
            :config {:theme "dark"}})

(println (update-in state [:user :visits] inc))
(println (assoc-in state [:config :font :size] 14))
(println (update-in state [:user :tags] conj "logic"))
(println (get-in state [:user :name]))
(println (get-in state [:user :email] "n/a"))
(println (update state :config dissoc :theme))
(println (update-vals {:a 1 :b 2} #(* % 10)))
