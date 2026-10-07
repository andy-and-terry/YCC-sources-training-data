(def person {:name "Ada" :address {:city "Berlin"}})

(println (some-> person :address :city))
(println (some-> person :address :zip))
(println (some-> person :missing :city))

(defn describe-number [n]
  (cond-> {:value n}
    (even? n) (assoc :parity :even)
    (odd? n) (assoc :parity :odd)
    (pos? n) (assoc :sign :positive)
    (neg? n) (assoc :sign :negative)))

(println (describe-number 4))
(println (describe-number -3))
