(defn classify [x]
  (case x
    0 "zero"
    (1 2 3) "small"
    :keyword "a keyword"
    "str" "a string"
    "other"))

(doseq [v [0 2 :keyword "str" 99]]
  (println (pr-str v) "=>" (classify v)))

(defn grade [score]
  (cond
    (>= score 90) "A"
    (>= score 80) "B"
    (>= score 70) "C"
    :else "F"))

(println (map grade [95 85 72 40]))
