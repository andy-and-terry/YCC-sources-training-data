(defn classify [n]
  (condp < n
    100 :huge
    10  :large
    0   :small
    :non-positive))

(defn day-type [d]
  (case d
    (:sat :sun) :weekend      ; grouped constants
    (:mon :tue :wed :thu :fri) :weekday
    :unknown))

(println (map classify [500 50 5 -1]))
(println (map day-type [:sat :mon :xyz]))

(println (condp = 3
           1 "one"
           3 "three"))
(println (condp some [1 2 3]
           #{0 9} :a
           #{2 7} :b))
