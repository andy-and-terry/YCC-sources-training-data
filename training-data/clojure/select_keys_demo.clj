(def user {:id 1 :name "Ada" :email "ada@example.com" :password "secret"})

(println (select-keys user [:id :name]))
(println (dissoc user :password))
(println (select-keys user [:id :missing]))
(println (zipmap [:x :y :z] [1 2 3]))
(println (clojure.set/rename-keys user {:name :full-name}))
