(defn greet
  ([] (greet "World"))
  ([name] (str "Hello, " name "!"))
  ([greeting name] (str greeting ", " name "!")))

(println (greet))
(println (greet "Ada"))
(println (greet "Hi" "Bob"))
