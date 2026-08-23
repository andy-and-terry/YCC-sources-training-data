(def data {:user {:name "Ada" :address {:city "Berlin"}}})

(println (get-in data [:user :address :city]))
(println (get-in data [:user :missing :field] "default"))
(println (assoc-in data [:user :address :zip] "10115"))
