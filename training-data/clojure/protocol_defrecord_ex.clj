(defprotocol Shape (area [s]))
(defrecord Circle [r] Shape (area [_] (* Math/PI r r)))
(defrecord Rect [w h] Shape (area [_] (* w h)))
(println (area (->Rect 3 4)))
