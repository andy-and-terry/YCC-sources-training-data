(defn digit-count [n]
  (count (str (Math/abs n))))

(println (digit-count 12345))
(println (digit-count 0))
