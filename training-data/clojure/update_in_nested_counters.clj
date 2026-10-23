(def state {:users {"ann" {:logins 1} "bob" {:logins 0}}})

(def s1 (update-in state [:users "ann" :logins] inc))
(def s2 (update-in s1 [:users "carl" :logins] (fnil inc 0)))
(def s3 (assoc-in s2 [:users "bob" :active?] true))

(println s3)
(println (get-in s3 [:users "carl" :logins]))
(println (reduce-kv (fn [m k v] (assoc m k (:logins v 0))) {} (:users s3)))
