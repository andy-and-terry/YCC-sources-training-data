(defmulti area :shape)
(defmethod area :circle [{:keys [r]}] (* Math/PI r r))
(defmethod area :rect [{:keys [w h]}] (* w h))
(println (area {:shape :rect :w 2 :h 5}))
