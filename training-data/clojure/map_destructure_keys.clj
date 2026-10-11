(defn describe [{:keys [name age] :or {age "unknown"} :as person}]
  (str name " (" age ") has " (count person) " fields"))

(println (describe {:name "Ada" :age 36}))
(println (describe {:name "Bob"}))

(let [{:strs [host port]} {"host" "localhost" "port" 8080}]
  (println host port))

(let [{{city :city} :address} {:address {:city "Oslo"}}]
  (println city))
