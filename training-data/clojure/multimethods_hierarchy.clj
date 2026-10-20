(defmulti area :shape)
(defmethod area :circle [{:keys [r]}] (* Math/PI r r))
(defmethod area :rect [{:keys [w h]}] (* w h))
(defmethod area :default [_] 0)

(println (area {:shape :circle :r 1}) (area {:shape :rect :w 2 :h 3}) (area {:shape :blob}))

(derive ::dog ::animal)
(derive ::cat ::animal)
(defmulti sound identity)
(defmethod sound ::animal [_] "generic")
(defmethod sound ::dog [_] "woof")
(println (sound ::dog) (sound ::cat) (isa? ::dog ::animal))
