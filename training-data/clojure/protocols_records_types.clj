(defprotocol Speaker
  (speak [this])
  (loud [this n]))

(defrecord Dog [name]
  Speaker
  (speak [_] (str name " says woof"))
  (loud [this n] (apply str (repeat n (speak this)))))

(defrecord Cat [name])
(extend-protocol Speaker
  Cat
  (speak [c] (str (:name c) " says meow"))
  (loud [c n] (str n)))

(println (speak (->Dog "Rex")) (speak (map->Cat {:name "Tom"})))
(println (loud (->Dog "R") 2) (:name (->Dog "x")) (assoc (->Dog "a") :age 3))
(println (satisfies? Speaker (->Dog "x")) (instance? clojure.lang.IRecord (->Dog "x")))
