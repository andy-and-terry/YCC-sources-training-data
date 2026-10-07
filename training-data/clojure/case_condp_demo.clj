(defn classify-day [day]
  (case day
    (:sat :sun) "weekend"
    (:mon :tue :wed :thu :fri) "weekday"
    "unknown"))

(defn describe-number [n]
  (condp = n
    0 "zero"
    1 "one"
    2 "two"
    "many"))

(defn bucket [n]
  (condp < n
    100 :huge
    10 :big
    0 :small
    :non-positive))

(println (classify-day :sat) (classify-day :wed) (classify-day :xyz))
(println (map describe-number [0 1 2 7]))
(println (map bucket [500 50 5 -1]))
