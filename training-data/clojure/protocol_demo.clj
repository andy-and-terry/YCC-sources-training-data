(defprotocol Shape
  (area [this]))

(defrecord Circle [radius]
  Shape
  (area [_] (* Math/PI radius radius)))

(defrecord Rectangle [width height]
  Shape
  (area [_] (* width height)))

(doseq [s [(->Circle 2) (->Rectangle 3 4)]]
  (println (area s)))
