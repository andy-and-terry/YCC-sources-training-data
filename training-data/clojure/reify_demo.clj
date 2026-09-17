(defprotocol Greeter
  (greet [this]))

(defn make-greeter [name]
  (reify Greeter
    (greet [_] (str "Hello, " name "!"))))

(def alice (make-greeter "Alice"))
(def bob (make-greeter "Bob"))

(println (greet alice))
(println (greet bob))

(def comparator-obj
  (reify java.util.Comparator
    (compare [_ a b] (compare b a))))

(println (sort comparator-obj [3 1 4 1 5 9 2 6]))
