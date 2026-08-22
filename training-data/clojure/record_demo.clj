(defrecord Point [x y])

(defn point-add [p1 p2]
  (->Point (+ (:x p1) (:x p2)) (+ (:y p1) (:y p2))))

(def p1 (->Point 1 2))
(def p2 (->Point 3 4))
(println (point-add p1 p2))
