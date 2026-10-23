(defmulti area :shape)

(defmethod area :circle [{:keys [r]}]
  (* Math/PI r r))

(defmethod area :rect [{:keys [w h]}]
  (* w h))

(defmethod area :default [_]
  0)

(println (area {:shape :rect :w 3 :h 4}))
(println (format "%.2f" (area {:shape :circle :r 1.0})))
(println (area {:shape :blob}))
