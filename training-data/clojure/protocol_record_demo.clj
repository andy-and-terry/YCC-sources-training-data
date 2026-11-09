(defprotocol Greeter (greet [this]))
(defrecord Person [name]
  Greeter
  (greet [_] (str "Hello, " name)))
(println (greet (->Person "Ada")))
