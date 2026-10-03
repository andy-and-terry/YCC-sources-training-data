(defn day-name [n]
  (case n
    1 "Monday"
    2 "Tuesday"
    3 "Wednesday"
    4 "Thursday"
    5 "Friday"
    (6 7) "Weekend"
    "Unknown"))

(doseq [n (range 1 8)]
  (println n "->" (day-name n)))
(println 9 "->" (day-name 9))
