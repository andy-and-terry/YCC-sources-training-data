(defmulti area :shape)

(defmethod area :circle [{:keys [radius]}]
  (* Math/PI radius radius))

(defmethod area :rectangle [{:keys [width height]}]
  (* width height))

(println (area {:shape :circle :radius 2}))
(println (area {:shape :rectangle :width 3 :height 4}))
