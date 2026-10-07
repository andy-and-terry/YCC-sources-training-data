(def db {:users {"ann" {:age 30 :tags ["a"]}
                 "bob" {:age 25 :tags []}}})

(println (assoc-in db [:users "ann" :age] 31))
(println (update-in db [:users "bob" :age] inc))
(println (update-in db [:users "bob" :tags] conj "new"))
(println (update-in db [:users "cy" :age] (fnil inc 0)))   ; creates missing path
(println (get-in db [:users "ann" :tags 0]))

