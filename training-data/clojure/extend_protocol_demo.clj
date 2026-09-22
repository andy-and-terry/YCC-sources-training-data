(defprotocol Describable
  (describe [this]))

(extend-protocol Describable
  String
  (describe [s] (str "a string of length " (count s)))

  Long
  (describe [n] (str "the number " n))

  nil
  (describe [_] "nothing at all"))

(println (describe "hello"))
(println (describe 42))
(println (describe nil))

(defrecord Point [x y])

(extend-type Point
  Describable
  (describe [p] (str "a point at (" (:x p) ", " (:y p) ")")))

(println (describe (->Point 3 4)))
