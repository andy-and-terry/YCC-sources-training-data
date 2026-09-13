(defprotocol Shape
  (area [this])
  (perimeter [this]))

(deftype Square [side]
  Shape
  (area [_] (* side side))
  (perimeter [_] (* 4 side)))

(deftype Rectangle [width height]
  Shape
  (area [_] (* width height))
  (perimeter [_] (* 2 (+ width height))))

(doseq [s [(Square. 4) (Rectangle. 3 5)]]
  (println (area s) (perimeter s)))
