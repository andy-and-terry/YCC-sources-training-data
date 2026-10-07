(defn find-user [id]
  (get {1 "Alice" 2 "Bob"} id))

(defn greet [id]
  (if-let [name (find-user id)]
    (str "Hello, " name "!")
    "User not found"))

(defn describe [coll]
  (when-let [first-item (first coll)]
    (println "First item is:" first-item)))

(println (greet 1))
(println (greet 99))
(describe [10 20 30])
(describe [])
