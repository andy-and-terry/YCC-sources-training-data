(defn digit-square-sum [n]
  (->> (str (Math/abs (long n)))
       (map #(Character/digit % 10))
       (map #(* % %))
       (reduce +)))

(println (digit-square-sum 123))
(println (digit-square-sum -99))
