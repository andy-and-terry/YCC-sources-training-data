(defn classify [x]
  (case x
    0 "zero"
    (1 2 3) "small"
    :kw "keyword"
    "other"))

(defn grade [score]
  (condp <= score
    90 "A"
    80 "B"
    70 "C"
    "F"))

(println (map classify [0 2 :kw 99]))
(println (map grade [95 85 72 10]))
(println (condp = :b :a 1 :b 2 :c 3))
