(defmulti area :shape)
(defmethod area :circle [{:keys [r]}] (* Math/PI r r))
(defmethod area :rect [{:keys [w h]}] (* w h))
(defmethod area :default [_] 0)

(println (area {:shape :circle :r 1}))
(println (area {:shape :rect :w 2 :h 3}))
(println (area {:shape :blob}))
